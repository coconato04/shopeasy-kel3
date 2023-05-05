// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shopeasy/screens/opening/signinpage.dart';
import 'package:shopeasy/services/auth.dart';

class signuppage extends StatelessWidget {
  const signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController usernameController =
        TextEditingController(); //need database
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController verifyPasswordController =
        TextEditingController();
    final auth = AuthService();

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
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.lightBlue.shade800,
                  onSaved: (username) {},
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.person),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
                      child: Icon(Icons.email),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
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
                const SizedBox(height: 20),
                TextFormField(
                  controller: verifyPasswordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: Colors.lightBlue.shade800,
                  decoration: InputDecoration(
                    hintText: "Verify password",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.lock_outline),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // Tambahkan logika untuk aksi tombol "SIGN UP"
                      if (passwordController.text ==
                          verifyPasswordController.text) {
                        print('Password matches');
                        dynamic result =
                            await auth.registerWithEmailAndPassword(
                                emailController.text, passwordController.text);
                        if (result == null) {
                          print('Registration Error');
                          print(
                              "${emailController.text} ${passwordController.text}"); //TODO: for debugging purpose only. remove this
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Registration Error. Please try again.'),
                            ),
                          );
                        } else {
                          print('Registration Success');
                          print(
                              result); //TODO: for debugging purpose only. remove this
                          //create user in database
                          auth.createUserWithEmail(
                              username: usernameController.text,
                              email: emailController.text);
                          Navigator.of(context).push(
                            //route to sign in
                            MaterialPageRoute(
                                builder: (context) => signinpage()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Registration Success. Please verify your email before signing in.'),
                            ),
                          );
                        }
                      } else {
                        print(
                            'Password does not match: ${passwordController.text} ${verifyPasswordController.text}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Password does not match. Please try again.'),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
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
