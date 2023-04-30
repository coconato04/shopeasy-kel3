// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shopeasy/screens/isiapp/content/profile.dart';
import 'package:shopeasy/screens/isiapp/content/salesmode.dart';
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

  //getters and setters
  String? get userID => _userData?['userID'];
  String? get username => _userData?['username'];
  String? get email => _userData?['email'];
  int? get easypayBalance => _userData?['easypayBalance'];
  String? get photoUrl => _userData?['photoUrl'];
  String? get createdAt => _userData?['createdAt'];

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
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage(
                        'assets/icon/her loss.png'), // Ganti dengan gambar profil pengguna
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()),
                          );
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
                          // Aksi ketika opsi notifikasi di klik
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.home_work),
                        title: const Text('toko anda'),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => HomeSalesPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.security),
                        title: const Text('Keamanan'),
                        onTap: () {
                          // Aksi ketika opsi keamanan di klik
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.history),
                        title: const Text('Riwayat Belanja'),
                        onTap: () {
                          // Aksi ketika opsi riwayat belanja di klik
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.discount),
                        title: const Text('kupon saya'),
                        onTap: () {
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
