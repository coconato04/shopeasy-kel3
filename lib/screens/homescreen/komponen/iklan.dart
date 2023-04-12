import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class iklan extends StatelessWidget {
  double getProportionateScreenWidth(double inputWidth, BuildContext context) {
    // Ganti dengan logika penghitungan lebar proporsional yang sesuai
    // misalnya: return inputWidth * 0.8;
    var screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  List<Map<String, dynamic>> popularItems = [
    {
      'imgUrl': 'assets/icon/Whiskas.png',
      'title': 'Item 1',
      'price': "3XX.XXX",
    },
    {
      'imgUrl': 'assets/icon/shoesbox.webp',
      'title': 'Item 2',
      'price': "1.XXX.XXX",
    },
    {
      'imgUrl': 'assets/icon/PS5.png',
      'title': 'Item 3',
      'price': "1.XXX.XXX",
    },
    {
      'imgUrl': 'assets/icon/perabotanrt.webp',
      'title': 'Item 4',
      'price': "1xX.XXX",
    }
    // Add more popular items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            height: getProportionateScreenWidth(200, context),
            viewportFraction: 0.9,
            enlargeCenterPage: true,
          ),
          items: popularItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    image: DecorationImage(
                      image: AssetImage(item['imgUrl']), // Update to AssetImage
                      fit: BoxFit
                          .cover, // Set fit property to cover the entire container
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "\Rp${item['price']}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lebaran Collection",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Up to 50% Off",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
