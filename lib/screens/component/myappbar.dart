import 'package:flutter/material.dart';
import 'package:shopeasy/screens/homescreen/homepage.dart';
import 'package:shopeasy/screens/isiapp/search.dart';

class myappbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCartPressed;
  final VoidCallback onNotificationPressed;
  final VoidCallback onSearchPressed;
  //final Color backgroundColor;
  final String searchProductText;
  final Color searchProductTextColor;
  final IconData searchProductIcon;
  final Color iconColor;
  final String leadingImagePath;
  final double leadingImageWidth;
  final double leadingImageHeight;

  myappbar({
    required this.onCartPressed,
    required this.onNotificationPressed,
    required this.onSearchPressed,
    //this.backgroundColor = Color.fromARGB(255, 0, 111, 202),
    this.searchProductText = 'Search Product',
    this.searchProductTextColor = Colors.black,
    this.searchProductIcon = Icons.search,
    this.iconColor = Colors.black,
    this.leadingImagePath = 'assets/icon/logo.png',
    this.leadingImageWidth = 25.0,
    this.leadingImageHeight = 25.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        elevation: 0.0,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Search()),
            );
          },
          child: Container(
            height: 27,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text(
                  searchProductText,
                  style: TextStyle(fontSize: 15, color: searchProductTextColor),
                ),
                SizedBox(width: 78),
                Icon(searchProductIcon, color: searchProductTextColor),
              ],
            ),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => homepage()),
            );
          },
          child: Image.asset(
            leadingImagePath,
            width: leadingImageWidth,
            height: leadingImageHeight,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: onCartPressed,
              color: iconColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: IconButton(
              icon: Icon(Icons.notifications_none_outlined),
              onPressed: onNotificationPressed,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
