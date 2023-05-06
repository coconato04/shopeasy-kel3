import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopeasy/screens/component/myappbar.dart';

class Transaction {
  final String id;
  final String date;
  final String total;
  final List<Product> products;
  final List<String> imageUrls;
  final double rating;

  Transaction({
    required this.id,
    required this.date,
    required this.total,
    required this.products,
    required this.imageUrls,
    required this.rating,
  });
}

class Product {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

class PurchaseHistoryPage1 extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '00001',
      date: '2023-04-20',
      total: '20.00',
      products: [
        Product(
            name: 'Product A',
            price: 10.00,
            quantity: 1,
            imageUrl: 'assets/icon/versace.png'),
        Product(
            name: 'Product B',
            price: 10.00,
            quantity: 1,
            imageUrl: 'assets/icon/her loss.png'),
      ],
      imageUrls: ['assets/icon/versace.png', 'assets/icon/her loss.png'],
      rating: 4.5,
    ),
    Transaction(
      id: '00002',
      date: '2022-04-25',
      total: '35.00',
      products: [
        Product(
            name: 'Product C',
            price: 5.00,
            quantity: 2,
            imageUrl: 'assets/icon/burberry.png'),
        Product(
            name: 'Product D',
            price: 10.00,
            quantity: 1,
            imageUrl: 'assets/icon/burberry.png'),
        Product(
            name: 'Product E',
            price: 5.00,
            quantity: 3,
            imageUrl: 'assets/icon/burberry.png'),
      ],
      imageUrls: ['assets/icon/burberry.png'],
      rating: 3.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(
        onCartPressed: () {},
        onNotificationPressed: () {
          // Aksi ketika tombol notifikasi ditekan
        },
        onSearchPressed: () {
          // Aksi ketika tombol pencarian ditekan
        },
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Transaction ID: ${transactions[index].id}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${transactions[index].date}'),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: transactions[index].rating,
                      minRating: 1,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '${transactions[index].rating}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'Products:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Column(
                  children: transactions[index]
                      .products
                      .map((product) => ListTile(
                            leading: Image.asset(
                              product.imageUrl,
                              width: 50.0,
                              height: 50.0,
                            ),
                            title: Text(product.name),
                            subtitle: Text(
                                'Price: ${product.price} x ${product.quantity}'),
                            trailing: Text(
                                'Total: ${(product.price * product.quantity).toStringAsFixed(2)}'),
                          ))
                      .toList(),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Total: ${transactions[index].total}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
              ],
            ),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Icon(Icons.shopping_cart),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailTransactionPage(
                    buyerName: 'nata',
                    buyerAddress: 'jakarta',
                    paymentMethod: 'bank',
                    products: transactions[index].products,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailTransactionPage extends StatelessWidget {
  final String buyerName;
  final String buyerAddress;
  final String paymentMethod;
  final List<Product> products;

  DetailTransactionPage({
    required this.buyerName,
    required this.buyerAddress,
    required this.paymentMethod,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Transaction'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buyer Name:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  buyerName,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Buyer Address:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  buyerAddress,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Payment Method:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  paymentMethod,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(products[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].name,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Quantity: ${products[index].quantity}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
