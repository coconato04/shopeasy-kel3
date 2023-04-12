import 'package:flutter/material.dart';
import '../component/myappbar.dart';

class wishlist extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<wishlist> {
  List<String> wishlistItems = []; // List untuk menyimpan item dalam wishlist

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            children: [
              // Produk 1
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon/logo.png'), // Ganti dengan sumber gambar yang sesuai
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Produk 1', // Ganti dengan nama produk yang sesuai
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Deskripsi Produk 1', // Ganti dengan deskripsi produk yang sesuai
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              // Aksi ketika tombol like ditekan
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                // Garis horizontal untuk membatasi antara dua produk
                thickness: 1.0, // Ketebalan garis
                color: Colors.grey, // Warna garis
                indent: 16.0, // Indent pada awal garis
                endIndent: 16.0, // Indent pada akhir garis
              ),
              // Produk 2
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon/logo.png'), // Ganti dengan sumber gambar yang sesuai
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Produk 2', // Ganti dengan nama produk yang sesuai
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Deskripsi Produk 2', // Ganti dengan deskripsi produk yang sesuai
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              // Aksi ketika tombol like ditekan
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                // Garis horizontal untuk membatasi antara dua produk
                thickness: 1.0, // Ketebalan garis
                color: Colors.grey, // Warna garis
                indent: 16.0, // Indent pada awal garis
                endIndent: 16.0, // Indent pada akhir garis
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon/logo.png'), // Ganti dengan sumber gambar yang sesuai
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Produk 3', // Ganti dengan nama produk yang sesuai
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Deskripsi Produk 3', // Ganti dengan deskripsi produk yang sesuai
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              // Aksi ketika tombol like ditekan
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                // Garis horizontal untuk membatasi antara dua produk
                thickness: 1.0, // Ketebalan garis
                color: Colors.grey, // Warna garis
                indent: 16.0, // Indent pada awal garis
                endIndent: 16.0, // Indent pada akhir garis
              ),
              // Produk 2
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon/logo.png'), // Ganti dengan sumber gambar yang sesuai
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Produk 2', // Ganti dengan nama produk yang sesuai
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Deskripsi Produk 2', // Ganti dengan deskripsi produk yang sesuai
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              // Aksi ketika tombol like ditekan
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                // Garis horizontal untuk membatasi antara dua produk
                thickness: 1.0, // Ketebalan garis
                color: Colors.grey, // Warna garis
                indent: 16.0, // Indent pada awal garis
                endIndent: 16.0, // Indent pada akhir garis
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon/logo.png'), // Ganti dengan sumber gambar yang sesuai
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Produk 3', // Ganti dengan nama produk yang sesuai
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Deskripsi Produk 3', // Ganti dengan deskripsi produk yang sesuai
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              // Aksi ketika tombol like ditekan
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                // Garis horizontal untuk membatasi antara dua produk
                thickness: 1.0, // Ketebalan garis
                color: Colors.grey, // Warna garis
                indent: 16.0, // Indent pada awal garis
                endIndent: 16.0, // Indent pada akhir garis
              ),
              // Produk 2
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon/logo.png'), // Ganti dengan sumber gambar yang sesuai
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Produk 2', // Ganti dengan nama produk yang sesuai
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Deskripsi Produk 2', // Ganti dengan deskripsi produk yang sesuai
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              // Aksi ketika tombol like ditekan
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                // Garis horizontal untuk membatasi antara dua produk
                thickness: 1.0, // Ketebalan garis
                color: Colors.grey, // Warna garis
                indent: 16.0, // Indent pada awal garis
                endIndent: 16.0, // Indent pada akhir garis
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon/logo.png'), // Ganti dengan sumber gambar yang sesuai
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Produk 3', // Ganti dengan nama produk yang sesuai
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Deskripsi Produk 3', // Ganti dengan deskripsi produk yang sesuai
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              // Aksi ketika tombol like ditekan
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                // Garis horizontal untuk membatasi antara dua produk
                thickness: 1.0, // Ketebalan garis
                color: Colors.grey, // Warna garis
                indent: 16.0, // Indent pada awal garis
                endIndent: 16.0, // Indent pada akhir garis
              ),
            ],
          ),
        ],
      ),
    );
  }
}
