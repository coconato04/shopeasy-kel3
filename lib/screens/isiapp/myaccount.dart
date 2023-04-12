import 'package:flutter/material.dart';

class myaccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
// Bagian Profil
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage(
                      'assets/icon/her loss.png'), // Ganti dengan gambar profil pengguna
                ),
                SizedBox(height: 16.0),
                Column(
                  children: [
                    Text(
                      'Nama Pengguna', // Ganti dengan nama pengguna
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'email@example.com', // Ganti dengan email pengguna
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Aksi ketika tombol edit profile di klik
                      },
                      icon: Icon(Icons.edit),
                      label: Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Divider(),
                // Bagian Opsi Pengaturan
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pengaturan',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifikasi'),
                      onTap: () {
                        // Aksi ketika opsi notifikasi di klik
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text('Bahasa'),
                      onTap: () {
                        // Aksi ketika opsi bahasa di klik
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.security),
                      title: Text('Keamanan'),
                      onTap: () {
                        // Aksi ketika opsi keamanan di klik
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Riwayat Belanja'),
                      onTap: () {
                        // Aksi ketika opsi riwayat belanja di klik
                      },
                    ),
                    // Tambahkan opsi pengaturan lain di sini
                  ],
                ),
                SizedBox(height: 16.0),
                Divider(),

                // Tombol Logout
                ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol logout di klik
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
