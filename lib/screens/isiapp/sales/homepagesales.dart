import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeStore extends StatefulWidget {
  @override
  _HomeStoreState createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  late DatabaseReference _databaseReference;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((value) {
      _databaseReference = FirebaseDatabase.instance.reference();
    });
  }

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
                StreamBuilder(
                  stream: _databaseReference != null
                      ? _databaseReference.child('products').onChildAdded
                      : null,
                  builder: (BuildContext context,
                      AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return Text('Loading...');
                    } else {
                      final data = snapshot.data!.snapshot.value as Map;
                      final products =
                          data.entries.map((entry) => entry.value).toList();
                      return Column(
                        children: products.map((product) {
                          return Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 15),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade300,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          product['image'],
                                          height: 120,
                                          width: 120,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          product['name'],
                                          style: TextStyle(),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Rp ${product['price']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Tambahkan aksi yang dijalankan ketika tombol 'Beli' diklik
                                          },
                                          child: Text('Beli'),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.orange,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 10),
                                            textStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
