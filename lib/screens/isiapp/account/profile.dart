import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  XFile? _imageFile;
  String _username = 'John Doe';

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
              width: 200.0,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveUsername,
              child: const Text('Save Username'),
            ),
          ],
        ),
      ),
    );
  }
}
