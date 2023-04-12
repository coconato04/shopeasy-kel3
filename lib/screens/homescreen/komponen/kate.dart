import 'package:flutter/material.dart';

class kate extends StatelessWidget {
  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  List<Map<String, dynamic>> menu = [
    {"icon": Icons.verified, "text": "Verified Store"},
    {"icon": Icons.discount, "text": "Today Promo"},
    {"icon": Icons.games, "text": "Game Shop"},
    {"icon": Icons.sports_motorsports, "text": "Sports Shop"},
    {"icon": Icons.more_horiz, "text": "More"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(1, context)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: menu.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 1.2, // Set childAspectRatio ke 1.0
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // Aksi ketika salah satu kategori ditekan
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(5, context),
              horizontal: getProportionateScreenWidth(5, context),
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Icon(
                  menu[index]["icon"],
                  color: Colors.white,
                  size: getProportionateScreenWidth(20, context),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(5, context),
                ),
                Text(
                  menu[index]["text"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(11, context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
