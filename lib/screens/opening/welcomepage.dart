import 'package:flutter/material.dart';
import 'logsig.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback hideCallback;

  const WelcomePage(
      {super.key,
      required this.hideCallback}); // Menggunakan required pada constructor
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background/bckg.webp', // Lokasi file gambar background
            fit: BoxFit.cover, // Penyesuaian gambar sebagai background
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 400, // Tinggi gambar
                  width: 400, // Lebar gambar
                  child: Image.asset(
                    'assets/icon/logo.png', // Lokasi file gambar PNG
                    fit: BoxFit
                        .contain, // Penyesuaian gambar sesuai ukuran container
                  ),
                ),
              ),
              const SizedBox(height: 0), // Jarak antara gambar dan tombol
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const logsig()),
                  );
                  // Aksi yang dijalankan saat tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30), // Mengatur border radius menjadi circular
                  ),
                  backgroundColor: Colors.blueGrey.withOpacity(
                      0.6), // Warna latar belakang tombol (biru pudar)
                  foregroundColor: Colors.white, // Warna teks pada tombol
                  padding: const EdgeInsets.symmetric(
                      horizontal: 110, vertical: 15), // Padding tombol
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                  height: 30), // Jarak antara tombol dan bagian bawah halaman
            ],
          ),
        ],
      ),
    );
  }
}
