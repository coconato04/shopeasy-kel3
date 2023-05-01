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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      Image.network('https://example.com/product1.jpg'),
                      Text('Product 1'),
                      Text('Price: \$50'),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Image.network('https://example.com/product2.jpg'),
                      Text('Product 2'),
                      Text('Price: \$75'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
