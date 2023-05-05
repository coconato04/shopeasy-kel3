import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KeamananPage extends StatelessWidget {
  final User user;

  KeamananPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        title: Text(
          'Keamanan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Username',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              user.displayName ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              user.email ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              user.phoneNumber ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '********',
                  style: TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Send password reset email to user
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: user.email!);
                    // Show snackbar to inform user
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'A password reset link has been sent to your email.'),
                      ),
                    );
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 16),
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
