// ignore_for_file: unused_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:shopeasy/screens/component/rootappbar.dart';
import 'package:shopeasy/screens/homescreen/homepage.dart';
import 'package:shopeasy/screens/isiapp/search.dart';
import 'package:shopeasy/screens/opening/signuppage.dart';
import 'package:shopeasy/services/auth.dart';

class signinpage extends StatelessWidget {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  signinpage({super.key});
  //When using emulator, and typing using physical (non-emulator) keyboard, the following error occurs:
  //Inactive InputConnection errors polute the log when inputting email and password using keyboard.
  //To fix the above, use the emulator keyboard instead.
  //Seems to be a longstanding TextEditingController issue:
  //https://github.com/flutter/flutter/issues/9471 opened since 2017 and still not closed/fixed.

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                    height: 50), // Jarak antara teks "LOGIN" dan email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.lightBlue.shade800,
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    hintText: "Your email",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.person),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                    height:
                        5), // Jarak antara email dan "EXAMPLE: axxxx@gmail,com"
                Row(
                  // Menggunakan Row untuk menampilkan teks EXAMPLE: axxxx@gmail,com dan ikon sedikit ke kanan
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      "EXAMPLE: axxxx@gmail.com",
                      style: TextStyle(fontSize: 11),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.transparent,
                    ) // Ikon panah ke kanan
                  ],
                ),
                const SizedBox(height: 25), // Jarak antara email dan password
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: Colors.lightBlue.shade800,
                  decoration: InputDecoration(
                    hintText: "Your password",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.lock),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ), // Jarak antara password dan tombol "FORGOT PASSWORD?"
                Row(
                  // Menggunakan Row untuk menampilkan tombol "FORGOT PASSWORD?" ke kanan
                  mainAxisAlignment:
                      MainAxisAlignment.end, // Mengatur posisi tombol ke kanan
                  children: [
                    TextButton(
                      onPressed: () {
                        // Tambahkan logika untuk aksi tombol "FORGOT PASSWORD?"
                      },
                      child: const Text(
                        'FORGOT PASSWORD?',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), //
                ElevatedButton(
                  onPressed: () async {
                    // Tambahkan logika untuk aksi tombol "LOGIN"
                    if (formKey.currentState!.validate()) {
                      // Validasi form
                      formKey.currentState!.save();
                      // Simpan nilai form
                      //login
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          emailController.text, passwordController.text);
                      if (result == null) {
                        print('Error Logging In');
                        print(
                            "${emailController.text} ${passwordController.text}"); //TODO: for debugging purpose only. remove this
                      } else {
                        print('Login Success');
                        print(
                            result); //TODO: for debugging purpose only. remove this
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Homepage()),
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const rootappbar()),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue.shade800,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 140, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                    height: 15), // Jarak antara tombol "LOGIN" dan teks "OR"
                const Text(
                  'OR',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                    height:
                        10), // Jarak antara teks "OR" dan tombol "SIGN IN WITH GOOGLE"
                ElevatedButton(
                  onPressed: () async {
                    // logic
                    dynamic result = await _auth.signInWithGoogle();
                    if (result == null) {
                      print('Error Logging In');
                    } else {
                      print('Login Success');
                      print(
                          result); //TODO: for debugging purpose only. remove this
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => rootappbar()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.black, // Warna garis pada sisi-sisinya
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icon/google.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'SIGN IN WITH GOOGLE',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height:
                        15), // Jarak antara tombol "SIGN IN WITH GOOGLE" dan teks "DON'T HAVE AN ACCOUNT?"
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.black, // Warna garis pada sisi-sisinya
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icon/facebook.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'SIGN IN WITH FACEBOOK',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  // Menggunakan Row untuk menampilkan teks "DON'T HAVE AN ACCOUNT?" dan tombol "SIGN UP"
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "DON'T HAVE AN ACCOUNT?",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => signuppage()),
                        );
                      },
                      child: const Text(
                        'SIGN UP HERE',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
