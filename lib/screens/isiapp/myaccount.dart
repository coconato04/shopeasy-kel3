// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shopeasy/screens/opening/logsig.dart';
import 'package:shopeasy/services/auth.dart' as auth;

class myaccount extends StatelessWidget {
  const myaccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    const Text(
                      'Nama Pengguna', // Ganti dengan nama pengguna
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'email@example.com', // Ganti dengan email pengguna
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Aksi ketika tombol edit profile di klik
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
                      leading: const Icon(Icons.language),
                      title: const Text('Bahasa'),
                      onTap: () {
                        // Aksi ketika opsi bahasa di klik
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
                    // Tambahkan opsi pengaturan lain di sini
                  ],
                ),
                const SizedBox(height: 16.0),
                const Divider(),

                // Tombol Logout
                ElevatedButton(
                  onPressed: () async {
                    // Aksi ketika tombol logout di klik
                    // TODO: Sign out user
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
    );
  }
}
