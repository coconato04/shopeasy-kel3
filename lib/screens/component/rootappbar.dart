import 'package:flutter/material.dart';
import 'package:shopeasy/screens/homescreen/homepage.dart';
import 'package:shopeasy/screens/isiapp/myaccount.dart';
import 'package:shopeasy/screens/isiapp/transaction.dart';
import 'package:shopeasy/screens/isiapp/wishlist.dart';
import 'package:shopeasy/screens/isiapp/search.dart';

class rootappbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<rootappbar> {
  final List<Widget> _widgetList = [
    homepage(),
    transaction(),
    Search(),
    wishlist(),
    myaccount(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Store', // Teks label untuk Store
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card,
            ),
            label: 'Transaction', // Teks label untuk My Cart
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search', // Teks label untuk Favourites
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: 'Favourites', // Teks label untuk Favourites
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: 'My Account', // Teks label untuk My Account
          )
        ],
      ),
      body: _widgetList[_index],
    );
  }
}
