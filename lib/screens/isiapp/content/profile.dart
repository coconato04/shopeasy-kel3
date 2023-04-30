import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfilePage extends StatefulWidget {
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

  void _saveUsername() {
    // Save username to database or storage
    String newUsername = _usernameController.text;
    // Your code to save the newUsername to database or storage
    setState(() {
      _username = newUsername;
      _usernameController.text = _username;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
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
                  ? AssetImage('assets/icon/her loss.png')
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
            Container(
              width: 300.0,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
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
              style: TextStyle(
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
