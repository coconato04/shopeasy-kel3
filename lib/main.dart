import 'package:flutter/material.dart';
import 'package:shopeasy/screens/opening/welcomepage.dart';
import 'package:shopeasy/screens/component/rootappbar.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // Menggunakan StatefulWidget agar dapat mengubah state
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showWelcomePage = true;
  bool _showRootAppBar =
      false; // Menambahkan flag untuk menampilkan/hide RootAppBar

  void _hideWelcomePage() {
    setState(() {
      _showWelcomePage = false;
      _showRootAppBar = true; // Mengubah flag untuk menampilkan RootAppBar
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Ariel',
      ),
      home: _showWelcomePage
          ? WelcomePage(
              hideCallback: () {
                _hideWelcomePage();
              },
            )
          : Container(), // Hanya menampilkan WelcomePage saja
    );
  }
}
