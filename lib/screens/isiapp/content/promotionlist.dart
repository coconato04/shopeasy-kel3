import 'package:flutter/material.dart';
import 'package:shopeasy/screens/component/myappbar.dart';

class PromotionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(
        onCartPressed: () {},
        onNotificationPressed: () {},
        onSearchPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            PromotionItem(
              title: 'Product 1',
              description: 'Description of Product 1',
              imageUrl: 'assets/icon/Whiskas.png',
            ),
            PromotionItem(
              title: 'Product 2',
              description: 'Description of Product 2',
              imageUrl: 'assets/icon/starboy.png',
            ),
            PromotionItem(
              title: 'Product 3',
              description: 'Description of Product 1',
              imageUrl: 'assets/icon/PS5.png',
            ),
            PromotionItem(
              title: 'Product 4',
              description: 'Description of Product 2',
              imageUrl: 'assets/icon/top reco.png',
            ),
            PromotionItem(
              title: 'Product 5',
              description: 'Description of Product 1',
              imageUrl: 'assets/icon/jordan.png',
            ),
            PromotionItem(
              title: 'Product 6',
              description: 'Description of Product 2',
              imageUrl: 'assets/icon/ikan.png',
            ),
            PromotionItem(
              title: 'Product 7',
              description: 'Description of Product 1',
              imageUrl: 'assets/icon/black opium.png',
            ),
            PromotionItem(
              title: 'Product 8',
              description: 'Description of Product 2',
              imageUrl: 'assets/icon/bag.png',
            ),
            PromotionItem(
              title: 'Product 9',
              description: 'Description of Product 1',
              imageUrl: 'assets/icon/hair dryer cart.png',
            ),
            PromotionItem(
              title: 'Product 10',
              description: 'Description of Product 2',
              imageUrl: 'assets/icon/p&b hoodie.png',
            ),
          ],
        ),
      ),
    );
  }
}

class PromotionItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  PromotionItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Add logic to perform when promotion item is tapped
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PromotionListPage(),
  ));
}
