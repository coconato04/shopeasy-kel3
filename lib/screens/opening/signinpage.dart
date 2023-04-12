import 'package:flutter/material.dart';
import 'package:shopeasy/screens/component/rootappbar.dart';
import 'package:shopeasy/screens/homescreen/homepage.dart';
import 'package:shopeasy/screens/isiapp/search.dart';
import 'package:shopeasy/screens/opening/signuppage.dart';

class signinpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50), // Jarak antara teks "LOGIN" dan email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.lightBlue.shade800,
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    hintText: "Your email",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.person),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        5), // Jarak antara email dan "EXAMPLE: axxxx@gmail,com"
                Row(
                  // Menggunakan Row untuk menampilkan teks EXAMPLE: axxxx@gmail,com dan ikon sedikit ke kanan
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "EXAMPLE: axxxx@gmail,com",
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
                SizedBox(height: 25), // Jarak antara email dan password
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: Colors.lightBlue.shade800,
                  decoration: InputDecoration(
                    hintText: "Your password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.lock),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
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
                      child: Text(
                        'FORGOT PASSWORD?',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), //
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => rootappbar()),
                    );
                    // Tambahkan logika untuk aksi tombol "LOGIN"
                    if (_formKey.currentState!.validate()) {
                      // Validasi form
                      _formKey.currentState!.save();
                      // Simpan nilai form
                      // Tambahkan logika untuk proses login
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue.shade800,
                    onPrimary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                    height: 15), // Jarak antara tombol "LOGIN" dan teks "OR"
                Text(
                  'OR',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                    height:
                        10), // Jarak antara teks "OR" dan tombol "SIGN IN WITH GOOGLE"
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk aksi tombol "SIGN IN WITH GOOGLE"
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icon/google.png', // Ganti dengan path gambar logo Google Anda
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'SIGN IN WITH GOOGLE',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        width: 1,
                        color: Colors.black, // Warna garis pada sisi-sisinya
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        15), // Jarak antara tombol "SIGN IN WITH GOOGLE" dan teks "DON'T HAVE AN ACCOUNT?"
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icon/facebook.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'SIGN IN WITH FACEBOOK',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        width: 1,
                        color: Colors.black, // Warna garis pada sisi-sisinya
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  // Menggunakan Row untuk menampilkan teks "DON'T HAVE AN ACCOUNT?" dan tombol "SIGN UP"
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DON'T HAVE AN ACCOUNT?",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => signuppage()),
                        );
                      },
                      child: Text(
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
