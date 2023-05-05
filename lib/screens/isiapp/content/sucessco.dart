import 'package:flutter/material.dart';
import 'package:shopeasy/screens/component/rootappbar.dart';

class PaymentSuccessPage extends StatelessWidget {
  final String message;

  PaymentSuccessPage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 16.0),
            Text(
              message,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => rootappbar()),
                );
              },
              child: Text('Back to Home'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
