// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class d extends StatelessWidget {
  d({super.key});

  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    // Ganti dengan logika penghitungan lebar proporsional yang sesuai
    // misalnya: return inputWidth * 0.8;
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  List<Map<String, dynamic>> categories = [
    {"icon": Icons.verified, "text": "Verified Store"},
    {"icon": Icons.discount, "text": "Today Promo"},
    {"icon": Icons.games, "text": "Game Shop"},
    {"icon": Icons.sports_motorsports, "text": "Sports Shop"},
    {"icon": Icons.more_horiz, "text": "More"},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20, context)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                // Aksi ketika item pertama pada baris kedua ditekan
              },
              child: Container(
                height: getProportionateScreenWidth(75, context),
                padding:
                    EdgeInsets.all(getProportionateScreenWidth(1, context)),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(-0.2, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right:
                                6.0), // Atur jarak kanan antara Container dan Text
                        child: Text(
                          "500K OFF ONLY UNTIL XX/MAY/2023",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.brown.shade700,
                            fontSize: getProportionateScreenWidth(9, context),
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(), // Menambahkan Spacer untuk menggeser ke bawah
                    Align(
                      alignment: Alignment
                          .bottomCenter, // Mengatur posisi gambar ke bawah
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/jordan.png',
                            height: getProportionateScreenWidth(50, context),
                          ),
                          SizedBox(
                              width: getProportionateScreenWidth(25, context)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(10, context)),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                // Aksi ketika item pertama pada baris kedua ditekan
              },
              child: Container(
                height: getProportionateScreenWidth(75, context),
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(1, context),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/icon/perabotan.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              "LIMITED",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize:
                                    getProportionateScreenWidth(8, context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              "STOCK FLASH SLAE UP TO ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize:
                                      getProportionateScreenWidth(8, context),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              "'90%'",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize:
                                      getProportionateScreenWidth(9, context),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: getProportionateScreenWidth(0, context),
                      // Mengurangi jarak antara gambar dan bawah
                      width: getProportionateScreenWidth(0, context),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(10, context)),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                // Aksi ketika item pertama pada baris kedua ditekan
              },
              child: Container(
                height: getProportionateScreenWidth(75, context),
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(1, context),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/icon/food.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(-0.2, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: Text(
                              "70%OFF FOOD COUPONS",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    getProportionateScreenWidth(7, context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0, top: 0),
                            child: Text(
                              "FOOD RECOMMENDATION",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize:
                                      getProportionateScreenWidth(7, context),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0, top: 0),
                            child: Text(
                              "'DISC UNTIL 110K'",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize:
                                      getProportionateScreenWidth(7, context),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0, top: 0),
                            child: Text(
                              "Tap Here!",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize:
                                    getProportionateScreenWidth(7, context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: getProportionateScreenWidth(3, context),
                      // Mengurangi jarak antara gambar dan bawah
                      width: getProportionateScreenWidth(10, context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
