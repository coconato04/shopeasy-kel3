import 'package:flutter/material.dart';
import 'package:shopeasy/screens/opening/signinpage.dart';

class signuppage extends StatelessWidget {
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
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.lightBlue.shade800,
                  onSaved: (username) {},
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.person),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.lightBlue.shade800,
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    hintText: "Your email",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.email),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
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
                SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: Colors.lightBlue.shade800,
                  decoration: InputDecoration(
                    hintText: "Verify password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.lock_outline),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Tambahkan logika untuk aksi tombol "SIGN UP"
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                    height: 10), // Jarak antara tombol "LOGIN" dan teks "OR"
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => signinpage()),
                        );
                      },
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                            fontSize: 12, color: Colors.lightBlue.shade800),
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
