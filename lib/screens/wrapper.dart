import 'package:flutter/material.dart';
import 'package:shopeasy/screens/homescreen/homepage.dart';
import 'package:shopeasy/screens/opening/welcomepage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either the homepage or the login page
    return WelcomePage(hideCallback: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => homepage()),
      );
    });
  }
}
