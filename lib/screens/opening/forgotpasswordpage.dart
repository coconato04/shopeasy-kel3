// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../component/rootappbar.dart';
import '../homescreen/homepage.dart';
import '../isiapp/search.dart';
import '../opening/signuppage.dart';
import 'otpform.dart';

class forgotpasswordpage extends StatefulWidget {
  const forgotpasswordpage({super.key});

  @override
  State<forgotpasswordpage> createState() => _forgotpasswordpageState();
}

class _forgotpasswordpageState extends State<forgotpasswordpage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'FORGOT PASSWORD',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                    height: 50), // Jarak antara teks "LOGIN" dan email
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                      child: Text(
                        "Email Adress",
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.lightBlue.shade800,
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    hintText: "example@stu.untar.ac.id",
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

                const SizedBox(height: 20), //
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const otpform()),
                    );
                    // Tambahkan logika untuk aksi tombol "LOGIN"
                    if (_formKey.currentState!.validate()) {
                      // Validasi form
                      _formKey.currentState!.save();
                      // Simpan nilai form
                      // Tambahkan logika untuk proses login
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
                    'SEND',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
