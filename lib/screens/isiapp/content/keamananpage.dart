import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopeasy/services/auth.dart' as auth;

void main() {
  runApp(keamananpage());
}

class keamananpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? _userData;

  @override
  initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await auth.AuthService().getUserData(user);
      setState(() {
        _userData = userData;
      });
    }
  }

  String get _username =>
      _userData?['username'] ??
      'If you\'re seeing this, something went wrong :)';
  String? get _email => _userData?['email'] ?? 'user@example.com';
  final String _phone = '123-456-7890';
  final String _password = '********';

  Future<void> resetPassword() async {
    await auth.AuthService().resetPassword(_email!);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset email sent'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        title: const Text(
          'Keamanan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Username',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              _username,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '$_email',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Phone',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              _phone,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _password,
                  style: const TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    // Implement password change logic
                    resetPassword();
                  },
                  child: const Text(
                    'Change Password',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
