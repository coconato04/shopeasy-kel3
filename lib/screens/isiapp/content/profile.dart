import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopeasy/services/auth.dart' as auth;

class EditProfilePage extends StatefulWidget {
  final void Function(String) updateProfilePicture;
  const EditProfilePage({required this.updateProfilePicture, super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  XFile? _imageFile;
  late TextEditingController _usernameController;
  String _email = '';
  String _username = ''; // Menambahkan deklarasi variabel _username
  String? _newPhotoUrl;

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
      final userData =
          await auth.AuthService().updateData(user, "users", field, newValue);
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Save new photo URL to database
      // ...

      // Call callback function to update profile picture in myaccount
      widget.updateProfilePicture(_newPhotoUrl!);

      // Go back to previous page
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const Text('Choose from library'),
                                  onTap: () {
                                    _pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.photo_camera),
                                  title: const Text('Take a picture'),
                                  onTap: () {
                                    _pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _imageFile != null
                          ? FileImage(File(_imageFile!.path))
                          : const AssetImage('assets/icon/usericon.png')
                              as ImageProvider,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    border: OutlineInputBorder(),
                  ),
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveUsername,
                        child: const Text('Save'),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
