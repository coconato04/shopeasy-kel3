import 'package:flutter/material.dart';
import 'package:shopeasy/screens/isiapp/content/detailco.dart';

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
                        builder: (context) => CheckoutPage(
                          totalPrice: _totalPrice,
                          customerInfo: {},
                        ),
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

class CheckoutPage extends StatefulWidget {
  final double totalPrice;
  final Map<String, dynamic> customerInfo;
  const CheckoutPage({
    Key? key,
    required this.totalPrice,
    required this.customerInfo,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  String? _selectedPaymentMethod;
  bool _isAgreedToTerms = false;
  final _formKey = GlobalKey<FormState>();

  void _placeOrder() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BillDetailPage(
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            address: _addressController.text,
            paymentMethod: _selectedPaymentMethod ?? '',
            totalPrice: widget.totalPrice,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.0),
                Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Total: \$${widget.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Divider(),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a payment method';
                    }
                    return null;
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'Credit Card',
                      child: Text('Credit Card'),
                    ),
                    DropdownMenuItem(
                      value: 'PayPal',
                      child: Text('PayPal'),
                    ),
                    DropdownMenuItem(
                      value: 'Cash on Delivery',
                      child: Text('Cash on Delivery'),
                    ),
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Checkbox(
                      value: _isAgreedToTerms,
                      onChanged: (value) {
                        setState(() {
                          _isAgreedToTerms = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'I have read and agree to the terms and conditions',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _selectedPaymentMethod != null &&
                        _isAgreedToTerms) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BillDetailPage(
                            name: _nameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            address: _addressController.text,
                            paymentMethod: _selectedPaymentMethod ?? '',
                            totalPrice: widget.totalPrice,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Process'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
