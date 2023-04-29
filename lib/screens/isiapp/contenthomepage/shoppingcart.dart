import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final List<Map<String, dynamic>> _cartItems = [
    {'name': 'Product 1', 'price': 10, 'image': 'logo.png', 'quantity': 0},
    {'name': 'Product 2', 'price': 20, 'image': 'logo.png', 'quantity': 0},
    {'name': 'Product 3', 'price': 30, 'image': 'her loss.png', 'quantity': 0},
  ];

  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();

    // Calculate the total price of items in the cart
    _totalPrice = _cartItems.fold<double>(
      0,
      (total, item) =>
          total + (item['price'] as double) * (item['quantity'] as int),
    );
  }

  void _increaseItemCount(int index) {
    setState(() {
      _cartItems[index]['quantity']++;
      _totalPrice += _cartItems[index]['price'];
    });
  }

  void _decreaseItemCount(int index) {
    setState(() {
      if (_cartItems[index]['quantity'] > 0) {
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
                  'Total: \$$_totalPrice',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page for checkout
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => CheckoutPage()),
                    );
                  },
                  child: Text('Checkout'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Text('Checkout page'),
      ),
    );
  }
}
