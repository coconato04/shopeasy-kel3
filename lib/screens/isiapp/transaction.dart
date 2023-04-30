import 'package:flutter/material.dart';
import 'package:shopeasy/screens/component/myappbar.dart';

class transaction extends StatefulWidget {
  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<transaction> {
  // initialize user data
  double _balance = 1000000.0;

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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Saldo Anda",
                          style: TextStyle(fontSize: 24.0),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "Rp${_balance.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 48.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
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
