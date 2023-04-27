// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class recomended extends StatelessWidget {
  recomended({super.key});

  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    // Ganti dengan logika penghitungan lebar proporsional yang sesuai
    // misalnya: return inputWidth * 0.8;
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20, context)),
        child: const Align(
          alignment: Alignment.centerLeft, // Align ke kiri
          child: Text(
            'Categories',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const <Widget>[
            SizedBox(width: 10),
            CategoryCard(
              icon: Icons.shopping_cart,
              title: 'Electronics',
            ),
            CategoryCard(
              icon: Icons.shopping_basket,
              title: 'Fashion',
            ),
            CategoryCard(
              icon: Icons.kitchen,
              title: 'Furniture',
            ),
            CategoryCard(
              icon: Icons.book,
              title: 'Education',
            ),
            CategoryCard(
              icon: Icons.music_note,
              title: 'Music',
            ),
            CategoryCard(
              icon: Icons.face_retouching_natural,
              title: 'Make up',
            ),
            CategoryCard(
              icon: Icons.more_horiz,
              title: 'More',
            ),
          ],
        ),
      )
    ]);
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      margin: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 27),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center, // Menyusun teks menjadi rata tengah
            style: const TextStyle(fontSize: 12), // Mengurangi ukuran teks
          ),
        ],
      ),
    );
  }
}
