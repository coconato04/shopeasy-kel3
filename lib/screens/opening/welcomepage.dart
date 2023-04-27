import 'package:flutter/material.dart';
import 'package:shopeasy/screens/component/rootappbar.dart';
import 'package:shopeasy/screens/homescreen/homepage.dart';
import 'logsig.dart';
import 'package:shopeasy/services/auth.dart' as auth;

class WelcomePage extends StatefulWidget {
  final VoidCallback hideCallback;

  const WelcomePage(
      {super.key,
      required this.hideCallback}); // Menggunakan required pada constructor
  @override
  WelcomePageState createState() => WelcomePageState(hideCallback: () {});
}

class WelcomePageState extends State<WelcomePage> {
  final VoidCallback hideCallback;

  initState() {
    super.initState();
    checkLoginStatus();
  }

  //check status login
  Future<void> checkLoginStatus() async {
    final authService = auth.AuthService();
    final isLoggedIn = await authService.isLoggedIn();
    if (isLoggedIn) {
      print(
          'Welcome page check: User is already logged in, moving to homepage instead');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const homepage()),
      );
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const rootappbar()),
      );
    } else {
      print('User is not logged in');
      //TODO: widget to show user is "not logged in"
    }
  }

  WelcomePageState(
      {required this.hideCallback}); // Menggunakan required pada constructor
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
