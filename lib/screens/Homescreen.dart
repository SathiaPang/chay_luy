import 'package:chay_luy/assets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> carBrand = [
    'Mercedes-Benz',
    'Toyota',
    'Ford',
    'Honda',
    'Chevrolet Tahoe'
  ];
  final List<String> Vehicletitle = [
    'Tesla Model 3',
    'BMW 335i M',
    'TOYOTA Yaris GR',
    'TOYOTA LAND CRUISER',
    'AUDI RS6 Avant'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Location",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Street 310, Phnom Penh",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: primeGreen), // Fallback color
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.search_circle),
            onPressed: () {
              print("you printed me");
            },
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.bell,
            ),
            onPressed: () {
              // Add your notification functionality here
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: CarSlider(),
          ),
          SizedBox(
            height: 100, // Set height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Make it horizontal
              itemCount: carBrand.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 20), // Space between items
                  width: 150, // Width of each item
                  decoration: BoxDecoration(
                    color:
                        Colors.blueAccent, // Background color for demonstration
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      carBrand[index],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Vehicle",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text("See All"),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Vehicletitle.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * 0.4,
                        height: 100,
                        decoration: BoxDecoration(
                          color: primeGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Text(
                        Vehicletitle[index],
                        style: AppTextStyles.title,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 18,
                              ),
                            ),
                            TextSpan(
                              text: ' 4.5 ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: black,
                              ),
                            ),
                            TextSpan(
                              text: '(124 reviews)',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      PriceTitle(),
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

  RichText PriceTitle() {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 16),
        children: [
          TextSpan(
            text: '\$', // Dollar sign or other currency symbol
            style: TextStyle(
              color: Colors.green, // Optional: color for the currency symbol
              fontWeight: FontWeight.bold,
              fontSize: 18, // Optional: slightly larger font for emphasis
            ),
          ),
          TextSpan(
            text: '15.00 ', // Price amount
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: '/ day', // Duration or rate
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Container CarSlider() {
    return Container(
      height: Get.height * 0.3,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/Jeep-suv.JPG'),
          fit: BoxFit.fill,
        ),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
