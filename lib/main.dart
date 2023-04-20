import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopeasy/screens/opening/welcomepage.dart';
import 'package:shopeasy/screens/component/rootappbar.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:shopeasy/screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: Wrapper(), // Hanya menampilkan WelcomePage saja
    );
  }
}
