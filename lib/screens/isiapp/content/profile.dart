import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopeasy/services/auth.dart' as auth;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  XFile? _imageFile;
  late TextEditingController _usernameController;
  String _email = '';
  String _username = ''; // Menambahkan deklarasi variabel _username

  @override
  void initState() {
    super.initState();
    // Get the email of the logged in user
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _email = currentUser.email!;
    }
    _usernameController = TextEditingController(text: _username);
  }

  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> saveUserData(String newValue, String field) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await auth.AuthService().updateUserData(
          user: user, collection: "users", field: field, value: newValue);
    }
  }

  void _saveUsername() {
    // Get the username from the text field
    String tempUsername = _usernameController.text;
    // username manipulation
    String newUsername = _email.substring(0, _email.indexOf('@'));
    ;
    if (tempUsername.isEmpty) {
      //take from email, already done
    } else {
      // Limit the username to 15 characters if it is more than 15 characters
      if (tempUsername.length > 15) {
        newUsername = tempUsername.substring(0, 15);
      } else {
        newUsername = tempUsername;
      }
    }
    // Your code to save the newUsername to database or storage
    saveUserData(newUsername, "username");
    setState(() {
      _username = newUsername;
      _usernameController.text = _username;
    });
    //move to profile page
    Navigator.pop(context);
    // Show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Username saved successfully.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: _imageFile == null
                  ? const AssetImage('assets/icon/her loss.png')
                  : FileImage(File(_imageFile!.path)) as ImageProvider<Object>?,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              child: const Text('Choose Image'),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 300.0,
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveUsername,
              child: const Text('Save Username'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Logged in as: $_email',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
