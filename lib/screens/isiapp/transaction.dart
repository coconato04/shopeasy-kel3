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

// menggunakan operator null-aware untuk mengecek apakah keterangan null atau tidak
  String getKeterangan(Map<String, dynamic> item) {
    return item["keterangan"]?.toString() ?? "-";
  }

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
        body: Column(
          children: [
            // Tambahkan TabBar di sini
            TabBar(
              tabs: [
                Tab(text: "Tabungan"),
                Tab(text: "Riwayat Transaksi"),
              ],

              indicatorColor: Color.fromARGB(255, 0, 167, 250),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              unselectedLabelColor: Colors
                  .grey[300], // menentukan warna teks Tab yang tidak aktif
              dividerColor: Colors.black,
            ),
            // Tambahkan Expanded agar ListView mengambil sisa ruang yang tersedia
            Expanded(
              // Letakkan TabBarView di sini
              child: TabBarView(
                children: [
                  // Tabungan
                  SaldoEasypay(saldo: saldo, riwayat: riwayat),
                  // Riwayat Transaksi
                  // Riwayat Transaksi
                  ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_upward, color: Colors.green),
                        title: Text("Penghasilan dari pekerjaan"),
                        subtitle: Text("25 April 2023"),
                        trailing: Text("+Rp500000.00"),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_downward, color: Colors.red),
                        title: Text("Membeli bahan makanan"),
                        subtitle: Text("24 April 2023"),
                        trailing: Text("-Rp100000.00"),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_upward, color: Colors.green),
                        title: Text("Penghasilan dari pekerjaan"),
                        subtitle: Text("23 April 2023"),
                        trailing: Text("+Rp500000.00"),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_downward, color: Colors.red),
                        title: Text("Membayar tagihan listrik"),
                        subtitle: Text("23 April 2023"),
                        trailing: Text("-Rp200000.00"),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_downward, color: Colors.red),
                        title: Text("Membeli tiket pesawat"),
                        subtitle: Text("22 April 2023"),
                        trailing: Text("-Rp1000000.00"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SaldoEasypay extends StatelessWidget {
  final double saldo;
  final List<Map<String, dynamic>> riwayat;
  SaldoEasypay({required this.saldo, required this.riwayat});
  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    // Ganti dengan logika penghitungan lebar proporsional yang sesuai
    // misalnya: return inputWidth * 0.8;
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  Widget build(BuildContext context) {
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
                  'Saldo Easypay anda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(16, context),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenWidth(10, context)),
                Text(
                  'Rp. ${saldo.toString()}',
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
              itemCount: riwayat.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> transaksi = riwayat![index];
                return ListTile(
                  title: Text(transaksi['keterangan']),
                  subtitle: Text(transaksi['tanggal']),
                  trailing: Text(transaksi['jumlah'].toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
