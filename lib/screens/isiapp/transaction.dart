// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopeasy/screens/component/myappbar.dart';
import 'package:shopeasy/services/auth.dart' as auth;

class transaction extends StatefulWidget {
  const transaction({super.key});
  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<transaction> {
  Map<String, dynamic>? _userData;
  double saldo = 0.0;
  List<Map<String, dynamic>> riwayat = [];

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
        saldo = _userData?['easypayBalance']?.toDouble() ?? 0.0;
        riwayat = [
          {
            "tanggal": "01/05/2023",
            "jumlah": 10000,
            "keterangan": "Top up saldo"
          },
          {
            "tanggal": "02/05/2023",
            "jumlah": 50000,
            "keterangan": "Top up saldo"
          },
          {
            "tanggal": "03/05/2023",
            "jumlah": 75000,
            "keterangan": "Top up saldo"
          },
          {
            "tanggal": "04/05/2023",
            "jumlah": 20000,
            "keterangan": "pembelian pulsa"
          },
          {
            "tanggal": "05/05/2023",
            "jumlah": 100000,
            "keterangan": "dana masuk"
          },
          {
            "tanggal": "06/05/2023",
            "jumlah": 200000,
            "keterangan": "pembayaran listrik"
          },
          {
            "tanggal": "07/05/2023",
            "jumlah": 50000,
            "keterangan": "top up saldo"
          },
          {
            "tanggal": "08/05/2023",
            "jumlah": 75000,
            "keterangan": "Top up saldo"
          },
          {
            "tanggal": "09/05/2023",
            "jumlah": 20000,
            "keterangan": "pembelian pulsa"
          },
          {
            "tanggal": "10/05/2023",
            "jumlah": 100000,
            "keterangan": "pembelian pulsa"
          },
        ];
      });
    }
  }

// menggunakan operator null-aware untuk mengecek apakah keterangan null atau tidak
  String getKeterangan() {
    return _userData?['keterangan']?.toString() ?? "-";
  }

//getters and setters
  String? get userID => _userData?['userID'];
  String? get username => _userData?['username'];
  String? get email => _userData?['email'];
  int? get easypayBalance => _userData?['easypayBalance'];
  String? get photoUrl => _userData?['photoUrl'];
  String? get createdAt => _userData?['createdAt'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: myappbar(
          onCartPressed: () {},
          onNotificationPressed: () {
            // Aksi ketika tombol notifikasi ditekan
          },
          onSearchPressed: () {
            // Aksi ketika tombol pencarian ditekan
          },
        ),
        body: SaldoEasypay(userData: _userData, riwayat: riwayat),
      ),
    );
  }
}

class SaldoEasypay extends StatelessWidget {
  final Map<String, dynamic>? userData;
  final List<Map<String, dynamic>> riwayat;

  SaldoEasypay({required this.userData, required this.riwayat});

  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  Icon getTransactionIcon(String keterangan) {
    IconData icon;
    Color color;
    if (keterangan == "dana masuk" || keterangan == "Top up saldo") {
      icon = Icons.arrow_circle_up;
      color = Colors.green;
    } else {
      icon = Icons.arrow_circle_down;
      color = Colors.red;
    }
    return Icon(
      icon,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double saldo = userData?['easypayBalance']?.toDouble() ?? 0.0;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Column(
        children: [
          Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Saldo Easypay',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(16, context),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenWidth(10, context)),
                Text(
                  'Rp. ${saldo.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20, context),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20, context)),
          Expanded(
              child: ListView.builder(
            itemCount: riwayat.length,
            itemBuilder: (context, index) {
              final transaksi = riwayat[index];
              return ListTile(
                leading: getTransactionIcon(transaksi['keterangan']),
                subtitle: Text(transaksi['tanggal']),
                title: Text(transaksi['keterangan']),
                trailing: Text(transaksi['jumlah'].toString()),
              );
            },
          )),
        ],
      ),
    );
  }
}
