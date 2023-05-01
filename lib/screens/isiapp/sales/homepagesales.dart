import 'package:flutter/material.dart';

class HomeStore extends StatefulWidget {
  @override
  _HomeStoreState createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeStore'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Tambahkan aksi yang dijalankan ketika ikon keranjang belanja diklik
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/icon/Whiskas.png'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Nama Toko',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tipe Toko',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(height: 25),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10,
                            left: 15), // Ubah padding sisi kiri di sini
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey
                                .shade300, // Ubah warna container menjadi hitam
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
                                  color: Colors
                                      .black, // Ubah warna teks menjadi putih
                                ),
                              ),
                              const Text(
                                'Harga 1',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors
                                      .black, // Ubah warna teks menjadi putih
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey
                                .shade300, // Ubah warna container menjadi hitam
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
                                  color: Colors
                                      .black, // Ubah warna teks menjadi putih
                                ),
                              ),
                              const Text(
                                'Harga 2',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors
                                      .black, // Ubah warna teks menjadi putih
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
                          right: 10,
                          left: 15), // Ubah padding sisi kiri di sini
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey
                              .shade300, // Ubah warna container menjadi hitam
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey
                              .shade300, // Ubah warna container menjadi hitam
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
                ]),
                const SizedBox(height: 15),
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10,
                          left: 15), // Ubah padding sisi kiri di sini
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey
                              .shade300, // Ubah warna container menjadi hitam
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey
                              .shade300, // Ubah warna container menjadi hitam
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
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Tambahkan aksi yang dijalankan ketika tombol tambah produk diklik
        },
      ),
    );
  }
}
