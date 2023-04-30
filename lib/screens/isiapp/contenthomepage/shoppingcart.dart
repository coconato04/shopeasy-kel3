import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final List<Map<String, dynamic>> _cartItems = [
    {'name': 'Product 1', 'price': 10.0, 'image': 'logo.png', 'quantity': 0},
    {'name': 'Product 2', 'price': 20.0, 'image': 'logo.png', 'quantity': 0},
    {
      'name': 'Product 3',
      'price': 30.0,
      'image': 'her loss.png',
      'quantity': 0
    },
  ];

  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();

    _totalPrice = _cartItems
        .fold<num>(
          0,
          (total, item) =>
              total + (item['price'] as num) * (item['quantity'] as num),
        )
        .toDouble();
  }

  void _increaseItemCount(int index) {
    setState(() {
      if (index >= 0 && index < _cartItems.length) {
        _cartItems[index]['quantity']++;
        _totalPrice += _cartItems[index]['price'];
      }
    });
  }

  void _decreaseItemCount(int index) {
    setState(() {
      if (index >= 0 &&
          index < _cartItems.length &&
          _cartItems[index]['quantity'] > 0) {
        _cartItems[index]['quantity']--;
        _totalPrice -= _cartItems[index]['price'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _cartItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/icon/${item['image']}'),
                  ),
                  title: Text(item['name'] as String),
                  subtitle: Text('Price: \$${item['price']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _increaseItemCount(index);
                        },
                      ),
                      Text(item['quantity'].toString()),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          _decreaseItemCount(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: \$${_totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CheckoutPage(totalPrice: _totalPrice),
                      ),
                    );
                  },
                  child: Text('Proceed to Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final double totalPrice;

  const CheckoutPage({Key? key, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Code to process checkout
              },
              child: Text('Process Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
