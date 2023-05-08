import 'package:flutter/material.dart';

class Product {
  final String title;
  final List<Product> products;
  final String imagePath;
  final String description;

  Product({
    required this.title,
    required this.products,
    required this.imagePath,
    required this.description,
  });
}

class ProductDetailPage extends StatelessWidget {
  final List<Product> products;
  final Product? selectedProduct;
  final Product product;

  ProductDetailPage(
      {required this.products, this.selectedProduct, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.imagePath,
                height: 300.0,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Price: \$10.00', // Ganti dengan harga produk yang sesuai
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Product Details:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
            ),
            SizedBox(height: 16.0),
            Text(
              'Other Products:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: product.products.map((otherProduct) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: otherProduct,
                          products: [],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          otherProduct.imagePath,
                          height: 60.0,
                          width: 60.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          otherProduct.title,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 8.0), // Ubah nilai padding sesuai kebutuhan
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Aksi untuk tombol Chat
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      // Aksi untuk tombol Chat
                    },
                    child: Text('Chat'),
                  ),
                ),
              ),
              Expanded(
                child: VerticalDivider(
                  color: Colors.grey.shade300,
                  width: 1.0,
                  thickness: 1.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Aksi untuk tombol Add to Cart
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Add to Cart'),
                ),
              ),
              Expanded(
                child: VerticalDivider(
                  color: Colors.grey.shade300,
                  width: 1.0,
                  thickness: 1.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Aksi untuk tombol Buy
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi untuk tombol Buy
                    },
                    child: Text('Buy'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: 'Product 1',
      imagePath: 'assets/icon/burberry.png',
      products: [],
      description: 'This is Product 1. Lorem ipsum dolor sit amet.',
    ),
    Product(
      title: 'Product 2',
      imagePath: 'assets/icon/her loss.png',
      products: [],
      description: 'This is Product 2. Lorem ipsum dolor sit amet.',
    ),
    Product(
      title: 'Product 3',
      imagePath: 'assets/icon/hoodie cart.png',
      products: [],
      description: 'This is Product 3. Lorem ipsum dolor sit amet.',
    ),
    Product(
      title: 'Product 4',
      imagePath: 'assets/icon/PS5.png',
      products: [],
      description: 'This is Product 3. Lorem ipsum dolor sit amet.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    product: products[index],
                    products: [],
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
