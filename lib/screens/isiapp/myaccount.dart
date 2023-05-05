// ignore_for_file: camel_case_types

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopeasy/screens/isiapp/content/keamanan.dart';
import 'package:shopeasy/screens/isiapp/content/kuponpage.dart';
import 'package:shopeasy/screens/isiapp/content/profile.dart';
import 'package:shopeasy/screens/isiapp/content/riwayatbelanja.dart';
import 'package:shopeasy/screens/isiapp/content/salesmode.dart';
import 'package:shopeasy/screens/isiapp/sales/homepagesales.dart';
import 'package:shopeasy/screens/isiapp/content/keamananpage.dart';
import 'package:shopeasy/screens/isiapp/content/notificationpage.dart';
import 'package:shopeasy/screens/isiapp/sales/registersales.dart';
import 'package:shopeasy/screens/opening/logsig.dart';
import 'package:shopeasy/services/auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';

class myaccount extends StatefulWidget {
  const myaccount({super.key});

  @override
  myaccountState createState() => myaccountState();
}

class myaccountState extends State<myaccount> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    isSeller();
    _photoUrl = 'assets/icon/Whiskas.png';
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await auth.AuthService().getUserData(user);
      setState(() {
        _userData = userData;
      });
    }
  }

  void _updateProfilePicture(String newPhotoUrl) {
    setState(() {
      _photoUrl = newPhotoUrl;
    });
  }

  void _navigateToEditProfilePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          updateProfilePicture: _updateProfilePicture,
        ),
      ),
    );
  }

  //getters and setters
  String? get userID => _userData?['userID'];
  String? get username => _userData?['username'];
  String? get email => _userData?['email'];
  int? get easypayBalance => _userData?['easypayBalance'];
  String? get photoUrl => _userData?['photoUrl'];
  String? get createdAt => _userData?['createdAt'];
  String? _photoUrl;
  bool _isSeller = false;

  Future isSeller() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      _isSeller = await auth.AuthService().isSeller(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Bagian Profil
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: _photoUrl != Null
                        ? NetworkImage(_photoUrl!) as ImageProvider<Object>?
                        : AssetImage('assets/icon/Whiskas.png')
                            as ImageProvider<Object>?,
                  ),

                  const SizedBox(height: 16.0),
                  Column(
                    children: [
                      Text(
                        '$username', // Ganti dengan nama pengguna
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '$email', // Ganti dengan email pengguna
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton.icon(
                        onPressed: () {
                          _navigateToEditProfilePage(context);
                          child:
                          Text('Edit Profile');
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(),
                  // Bagian Opsi Pengaturan
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pengaturan',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      ListTile(
                        leading: const Icon(Icons.notifications),
                        title: const Text('Notifikasi'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => NotificationPage()),
                          );
                          // Aksi ketika opsi notifikasi di klik
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.home_work),
                        title: const Text('Toko Saya'),
                        onTap: () {
                          User? user = FirebaseAuth.instance.currentUser;
                          if (_isSeller == false) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => RegisterSales()),
                            );
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => HomeStore()),
                            );
                          }
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.security),
                        title: const Text('Keamanan'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => keamananpage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.history),
                        title: const Text('Riwayat Belanja'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PurchaseHistoryPage1()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.discount),
                        title: const Text('Kupon Saya'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => kuponpage()),
                          );
                          // Aksi ketika opsi riwayat belanja di klik
                        },
                      ),
                      // Tambahkan opsi pengaturan lain di sini
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(),
                  // Tombol Logout
                  ElevatedButton(
                    onPressed: () async {
                      // Aksi ketika tombol logout di klik
                      await auth.AuthService().signOut();
                      print('signout attempt');
                      // Move to logsig screen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const logsig()),
                      );
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
