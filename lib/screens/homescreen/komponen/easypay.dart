// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopeasy/services/auth.dart' as auth;

class easypay extends StatefulWidget {
  const easypay({super.key});

  @override
  easypayState createState() => easypayState();
}

class easypayState extends State<easypay> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await auth.AuthService().getUserData(user);
      setState(() {
        _userData = userData;
      });
    }
  }

  //getters and setters
  String? get userID => _userData?['userID'];
  String? get username => _userData?['username'];
  String? get email => _userData?['email'];
  int? get easypayBalance => _userData?['easypayBalance'];
  String? get photoUrl => _userData?['photoUrl'];
  String? get createdAt => _userData?['createdAt'];

  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    // Ganti dengan logika penghitungan lebar proporsional yang sesuai
    // misalnya: return inputWidth * 0.8;
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20, context)),
        child: Container(
          height: getProportionateScreenWidth(100, context),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20, context),
            vertical: getProportionateScreenWidth(20, context),
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(5, context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your EasyPay',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp. $easypayBalance',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(13, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(15, context)),
              Container(
                width: getProportionateScreenWidth(
                    2, context), // atur lebar garis vertikal
                color: Colors.black, // atur warna garis vertikal
                height: double.infinity, // atur tinggi garis vertikal
              ),
              SizedBox(width: getProportionateScreenWidth(20, context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rewards',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Platinum Member',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '9+ new coupons',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(11, context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
