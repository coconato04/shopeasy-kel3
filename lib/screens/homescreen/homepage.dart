import 'package:flutter/material.dart';
import 'package:shopeasy/screens/component/myappbar.dart';
import 'package:shopeasy/screens/homescreen/komponen/iklan.dart';
import 'package:shopeasy/screens/homescreen/komponen/recomended.dart';
import 'package:shopeasy/screens/homescreen/komponen/tamp.dart';

//TODO: appbar di bawahnya kyknya hilang

class homepage extends StatelessWidget {
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
          tamp(),
          SizedBox(
            height: 15,
          ),
          iklan(),
          SizedBox(
            height: 15,
          ),
          recomended(),
          SizedBox(
            height: 15,
          ),
          barisan(),
        ],
      ),
    );
  }
}

class Homepage extends StatelessWidget {
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
          tamp(),
          SizedBox(
            height: 15,
          ),
          iklan(),
          SizedBox(
            height: 15,
          ),
          recomended(),
          SizedBox(
            height: 15,
          ),
          barisan(),
        ],
      ),
    );
  }
}

class barisan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 10, left: 15), // Ubah padding sisi kiri di sini
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nama 1',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Ubah warna teks menjadi putih
                      ),
                    ),
                    Text(
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
              padding: EdgeInsets.only(right: 15, left: 5),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nama 2',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Ubah warna teks menjadi putih
                      ),
                    ),
                    Text(
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
      SizedBox(height: 15),
      Row(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                right: 10, left: 15), // Ubah padding sisi kiri di sini
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hoodie',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
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
            padding: EdgeInsets.only(right: 15, left: 5),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nama 4',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
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
