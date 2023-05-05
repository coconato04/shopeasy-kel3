// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shopeasy/screens/component/rootappbar.dart';
import 'package:shopeasy/screens/opening/signinpage.dart';
import 'package:shopeasy/screens/opening/signuppage.dart';
import 'package:shopeasy/screens/homescreen/homepage.dart';
import 'package:shopeasy/services/auth.dart' as auth;

class logsig extends StatefulWidget {
  const logsig({Key? key}) : super(key: key);

  @override
  LogsigState createState() => LogsigState();
}

class LogsigState extends State<logsig> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  //check status login
  Future<void> checkLoginStatus() async {
    final authService = auth.AuthService();
    final isLoggedIn = await authService.isLoggedIn();
    if (isLoggedIn) {
      print('User is already logged in: moving to homepage instead');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const homepage()),
      );
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const rootappbar()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Welcome back!'),
        ),
      );
    } else {
      print('User is not logged in');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please login first!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          SizedBox(
            height: 320,
            width: 400,
            child: Image.asset(
              'assets/icon/prolog.jpg',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => signinpage()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.lightBlue.shade800,
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'or',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const signuppage()),
              );
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.blueGrey,
              disabledForegroundColor: Colors.black,
              padding:
                  const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
