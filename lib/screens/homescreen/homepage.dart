// ignore_for_file: camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shopeasy/screens/isiapp/sales/detailproduct.dart';
import 'package:shopeasy/screens/opening/logsig.dart';
import 'package:shopeasy/services/auth.dart' as auth;
import 'package:shopeasy/screens/component/myappbar.dart';
import 'package:shopeasy/screens/homescreen/komponen/iklan.dart';
import 'package:shopeasy/screens/homescreen/komponen/recomended.dart';
import 'package:shopeasy/screens/homescreen/komponen/tamp.dart';
import 'package:shopeasy/screens/component/rootappbar.dart';

//TODO: appbar di bawahnya kyknya hilang
//TODO: signoutnya di notif sbagai plaeceholder. pindahin codenya kalo udh ada tombol signout
//TODO: tambah initState untuk mengecek apabila user signed in atau tidak

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  homepageState createState() => homepageState();
}

class homepageState extends State<homepage> {
  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    // Ganti dengan logika penghitungan lebar proporsional yang sesuai
    // misalnya: return inputWidth * 0.8;
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  //check status login
  Future<void> checkLoginStatus() async {
    final authService = auth.AuthService();
    final isLoggedIn = await authService.isLoggedIn();
    if (isLoggedIn) {
      print('Homepage login check: User is already logged in');
    } else {
      print('Homepage login check: User is not logged in');
      //TODO: widget to show user is "not logged in"
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const logsig()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: myappbar(
          onCartPressed: () {
            // Aksi ketika tombol keranjang belanja ditekan
          },
          onNotificationPressed: () async {
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
        onNotificationPressed: () async {
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
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        products: ProductListPage()
                            .products, // Menggunakan daftar produk dari ProductListPage
                        product: ProductListPage().products[
                            0], // Menggunakan produk pertama dari daftar produk
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10, left: 15),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
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
                        SizedBox(height: 10),
                        Text(
                          'burberry',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '20.99',
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
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        products: ProductListPage()
                            .products, // Menggunakan daftar produk dari ProductListPage
                        product: ProductListPage().products[
                            1], // Menggunakan produk pertama dari daftar produk
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 15, left: 5),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
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
                        SizedBox(height: 10),
                        Text(
                          'album',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '49.99',
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
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        products: ProductListPage()
                            .products, // Menggunakan daftar produk dari ProductListPage
                        product: ProductListPage().products[
                            2], // Menggunakan produk pertama dari daftar produk
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10, left: 15),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
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
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        products: ProductListPage()
                            .products, // Menggunakan daftar produk dari ProductListPage
                        product: ProductListPage().products[
                            0], // Menggunakan produk pertama dari daftar produk
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 15, left: 5),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
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
                          'colgate',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '2.99',
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
            ),
          ],
        ),
      ],
    );
  }
}
