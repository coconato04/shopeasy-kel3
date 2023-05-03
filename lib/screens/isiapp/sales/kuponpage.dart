import 'package:flutter/material.dart';

class kuponpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        title: Text('Coupon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Coupons',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CouponCard(
              code: 'SUMMER21',
              discount: '20%',
              description: 'Get 20% off your purchase this summer',
              expiryDate: 'September 21, 2023',
            ),
            SizedBox(height: 20),
            CouponCard(
              code: 'BACKTOSCHOOL',
              discount: '10%',
              description:
                  'Get 10% off your purchase for back-to-school season',
              expiryDate: 'August 18, 2023',
            ),
            SizedBox(height: 20),
            CouponCard(
              code: 'TENZGG',
              discount: '10%',
              description: "10% Off on Any Subscription",
              expiryDate: 'December 21, 2023',
            ),
          ],
        ),
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  final String code;
  final String discount;
  final String description;
  final String expiryDate;

  CouponCard({
    required this.code,
    required this.discount,
    required this.description,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              code,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              discount,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Expires on $expiryDate',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
