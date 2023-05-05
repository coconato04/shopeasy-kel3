import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SalesPage extends StatefulWidget {
  @override
  _HomeSalesPageState createState() => _HomeSalesPageState();
}

class _HomeSalesPageState extends State<SalesPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  File? _imageFile;
  String _itemName = '';
  String _itemDescription = '';
  String _itemCategory = '';
  int _itemPrice = 0;
  int _itemStock = 0;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future<String> _uploadImage() async {
    final Reference storageRef =
        _storage.ref().child('images/${_imageFile!.path}');
    final UploadTask uploadTask = storageRef.putFile(_imageFile!);
    final TaskSnapshot snapshot = await uploadTask;
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> _addItem() async {
    final User? user = _auth.currentUser;

    // add to database
    //final String photoUrl = await _uploadImage();
    final DocumentReference documentReference =
        _db.collection('products').doc();
    final String itemId = documentReference.id;
    await documentReference.set({
      'productName': _itemName,
      'productInfo': _itemDescription,
      'productCategory': _itemCategory,
      'productPrice': _itemPrice,
      'productInventory': _itemStock,
      'photoUrl': '', //photoUrl,
      'productID': itemId,
      'sellerID': user!.uid,
      'productRating': [],
      'productReviews': [],
    });

    // add to seller's product list
    final DocumentReference sellerReference =
        _db.collection('sellers').doc(user.uid);
    await sellerReference.update({
      'shopProductsID': FieldValue.arrayUnion([itemId]),
    });

    print('item added');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Barang berhasil ditambahkan.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Sales'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    height: 300,
                    width: 300,
                  )
                : Container(
                    height: 300,
                    width: 300,
                    color: Colors.grey[200],
                    child: Icon(Icons.image, size: 100),
                  ),
            ElevatedButton(
              child: Text('Pilih Gambar'),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nama Barang'),
              onChanged: (value) {
                setState(() {
                  _itemName = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Deskripsi Barang'),
              onChanged: (value) {
                setState(() {
                  _itemDescription = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Kategori Barang'),
              onChanged: (value) {
                setState(() {
                  _itemCategory = value;
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Harga Barang'),
              onChanged: (value) {
                setState(() {
                  _itemPrice = int.parse(value);
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Stok Barang'),
              onChanged: (value) {
                setState(() {
                  _itemStock = int.parse(value);
                });
              },
            ),
            ElevatedButton(
              child: Text('Tambahkan Barang'),
              onPressed: () {
                _addItem();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
