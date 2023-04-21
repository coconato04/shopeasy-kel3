import 'package:flutter/material.dart';
import 'package:shopeasy/screens/opening/signinpage.dart';
import 'package:shopeasy/screens/opening/signuppage.dart';
import 'package:shopeasy/screens/homescreen/homepage.dart';
import 'package:shopeasy/services/auth.dart' as auth;

class logsig extends StatefulWidget {
  const logsig({Key? key}) : super(key: key);

  @override
  _LogsigState createState() => _LogsigState();
}

class _LogsigState extends State<logsig> {
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
        MaterialPageRoute(builder: (context) => homepage()),
      );
    } else {
      print('User is not logged in');
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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Container(
            height: 320,
            width: 400,
            child: Image.asset(
              'assets/icon/prolog.jpg',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => signinpage()),
              );
            },
            child: Text(
              'Sign In',
              style: TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              primary: Colors.lightBlue.shade800,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 110, vertical: 15),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'or',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => signuppage()),
              );
            },
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.blueGrey,
              onSurface: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 110, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}
