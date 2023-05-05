import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<List<dynamic>>> searchProducts(String search) async {
    List<List<dynamic>> products = [];
    final productData = await _firestore
        .collection('products')
        .where('productName', isGreaterThanOrEqualTo: search)
        .where('productName', isLessThanOrEqualTo: '$search\uf8ff')
        .get();
    if (productData.docs.isNotEmpty) {
      for (var i = 0; i < productData.docs.length; i++) {
        String productName = productData.docs[i].data()['productName'];
        if (productName.toLowerCase().contains(search.toLowerCase())) {
          products.add([productName]);
        }
      }
    }
    print(products);
    return products;
  }
}
