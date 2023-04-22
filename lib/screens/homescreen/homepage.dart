// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shopeasy/screens/opening/logsig.dart';
import 'package:shopeasy/services/auth.dart' as auth;
import 'package:shopeasy/screens/component/myappbar.dart';
import 'package:shopeasy/screens/homescreen/komponen/iklan.dart';
import 'package:shopeasy/screens/homescreen/komponen/recomended.dart';
import 'package:shopeasy/screens/homescreen/komponen/tamp.dart';

//TODO: appbar di bawahnya kyknya hilang
//TODO: signoutnya di notif sbagai plaeceholder. pindahin codenya kalo udh ada tombol signout

class homepage extends StatelessWidget {
  const homepage({super.key});

  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    // Ganti dengan logika penghitungan lebar proporsional yang sesuai
    // misalnya: return inputWidth * 0.8;
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myappbar(
        onCartPressed: () {
          // Aksi ketika tombol keranjang belanja ditekan
        },
        onNotificationPressed: () async {
          // Aksi ketika tombol notifikasi ditekan
          // TODO: Sign out user
          await auth.AuthService().signOut();
          print('signout attempt');
          // Move to logsig screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const logsig()),
          );
        },
        onSearchPressed: () {
          // Aksi ketika tombol pencarian ditekan
        },
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const tamp(),
          const SizedBox(
            height: 15,
          ),
          iklan(),
          const SizedBox(
            height: 15,
          ),
          recomended(),
          const SizedBox(
            height: 15,
          ),
          const barisan(),
        ],
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    // Ganti dengan logika penghitungan lebar proporsional yang sesuai
    // misalnya: return inputWidth * 0.8;
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myappbar(
        onCartPressed: () {
          // Aksi ketika tombol keranjang belanja ditekan
        },
        onNotificationPressed: () {
          // Aksi ketika tombol notifikasi ditekan
        },
        onSearchPressed: () {
          // Aksi ketika tombol pencarian ditekan
        },
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const tamp(),
          const SizedBox(
            height: 15,
          ),
          iklan(),
          const SizedBox(
            height: 15,
          ),
          recomended(),
          const SizedBox(
            height: 15,
          ),
          const barisan(),
        ],
      ),
    );
  }
}

class barisan extends StatelessWidget {
  const barisan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 10, left: 15), // Ubah padding sisi kiri di sini
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors
                      .grey.shade300, // Ubah warna container menjadi hitam
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icon/burberry.png', // Ganti dengan path gambar yang sesuai
                      height: 120,
                      width: 120,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nama 1',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Ubah warna teks menjadi putih
                      ),
                    ),
                    const Text(
                      'Harga 1',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black, // Ubah warna teks menjadi putih
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 5),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors
                      .grey.shade300, // Ubah warna container menjadi hitam
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icon/her loss.png', // Ganti dengan path gambar yang sesuai
                      height: 120,
                      width: 120,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nama 2',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Ubah warna teks menjadi putih
                      ),
                    ),
                    const Text(
                      'Harga 2',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black, // Ubah warna teks menjadi putih
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 15),
      Row(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                right: 10, left: 15), // Ubah padding sisi kiri di sini
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    Colors.grey.shade300, // Ubah warna container menjadi hitam
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icon/hoodie cart.png', // Ganti dengan path gambar yang sesuai
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Hoodie',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "2.99",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 5),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    Colors.grey.shade300, // Ubah warna container menjadi hitam
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icon/colgate.png', // Ganti dengan path gambar yang sesuai
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Nama 4',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Harga 4',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ])
    ]);
  }
}
