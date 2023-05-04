import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopeasy/services/auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';

class RegisterSales extends StatefulWidget {
  @override
  _RegisterStorePageState createState() => _RegisterStorePageState();
}

class _RegisterStorePageState extends State<RegisterSales> {
  final _formKey = GlobalKey<FormState>();

  String _storeName = '';
  String _storeDescription = '';
  String? _storeCategory;
  File? _storeImage;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _storeImage = File(pickedFile.path);
      }
    });
  }

  void _registerStore() async {
    if (_storeName.isEmpty ||
        _storeDescription.isEmpty ||
        _storeCategory == null) {
      //_storeImage == null
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all the fields'),
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      // Store the data to database
      User? user = FirebaseAuth.instance.currentUser;
      String userID = user!.uid;
      await auth.AuthService().createSellerAccount(
          userID: userID,
          sellerName: _storeName,
          sellerDesc: _storeDescription);
      await auth.AuthService().updateData(user, "users", "isSeller", true);
      // Then, navigate to the store page
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        title: Text('Register Store'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _storeImage != null
                  ? Image.file(
                      _storeImage!,
                      height: 300,
                      width: 300,
                    )
                  : Container(
                      height: 300,
                      width: 300,
                      color: Colors.grey[200],
                      child: Icon(Icons.image, size: 100),
                    ),
              ElevatedButton.icon(
                onPressed: _getImage,
                icon: Icon(Icons.image),
                label: Text('Choose Image'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Store Name'),
                onChanged: (value) {
                  setState(() {
                    _storeName = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Store Description'),
                onChanged: (value) {
                  setState(() {
                    _storeDescription = value;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Store Category'),
                value: _storeCategory,
                onChanged: (value) {
                  setState(() {
                    _storeCategory = value;
                  });
                },
                items: <String>[
                  'Electronics',
                  'Fashion',
                  'Food and Beverage',
                  'Furniture',
                  'Grocery',
                  'Health',
                  'Education',
                  'Others',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                child: Text('Register Store'),
                onPressed: _registerStore,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
