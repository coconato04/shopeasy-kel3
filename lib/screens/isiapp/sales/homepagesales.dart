import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopeasy/screens/isiapp/content/salesmode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopeasy/services/auth.dart' as auth;
import 'package:shopeasy/services/ProductInfoService.dart' as productInfo;

class HomeStore extends StatefulWidget {
  @override
  _HomeStoreState createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  Map<String, dynamic>? _storeData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final storeData = await auth.AuthService().getData(user, "sellers");
      setState(() {
        _storeData = storeData;
      });
    }
  }

//getters and setters
  String? get userID => _storeData?['shopID'];
  String? get shopname => _storeData?['shopName'];
  String? get shopBio => _storeData?['shopBio'];
  List<dynamic>? get photoUrl => _storeData?['photoUrl'];
  List<dynamic>? get shopProductsID => _storeData?['shopProductsID'];

  Future<List<List<dynamic>>> listProducts(List<dynamic>? shopProducts) async {
    List<List<dynamic>> products = [];
    productInfo.ProductDataService searchService =
        productInfo.ProductDataService();
    products = await searchService.listProductsData(shopProducts);
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toko Saya"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
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
                    shopname ?? 'Nama Toko',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 8),
                  Text(
                    shopBio ?? '',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(height: 25),
            FutureBuilder(
              future: listProducts(shopProductsID),
              builder: (context, AsyncSnapshot<List<List<dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Toko tidak memiliki produk'));
                }
                List<List<dynamic>> products = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              products[index][6].toString(), // product name
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              'Rp ${products[index][7].toString()}', // product price
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                child: Text('Tambahkan Produk'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SalesPage(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
