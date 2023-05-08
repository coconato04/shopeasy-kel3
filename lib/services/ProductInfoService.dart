import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<List<dynamic>>> listProductsData(
      List<dynamic>? shopProducts) async {
    List<List<dynamic>> products = [];
    if (shopProducts != null) {
      for (var i = 0; i < shopProducts.length; i++) {
        String a = shopProducts[i];
        final productData =
            await _firestore.collection('products').doc(a as String?).get();
        if (productData.exists) {
          products.add(productData.data()!.values.toList());
          print(products);
        }
      }
    }
    return products;
  }

  //get data from firestore
  Future getProductData(String productID) async {
    try {
      final docProduct = await FirebaseFirestore.instance
          .collection('products')
          .doc(productID)
          .get();
      return docProduct.data();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
