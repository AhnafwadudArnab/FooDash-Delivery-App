import 'package:FooDash_App/Pages/Downbar/BottomNavigationButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferPage extends StatelessWidget {
  final List<Map<String, dynamic>> offers = [
    {
      'title': '50% Off on First Order',
      'description': 'Get a massive 50% discount on your first order! Limited time only.',
      'image': 'assets/images/Offers/food-coupons.png',
      'validity': 'Valid till: 30th Sep 2024',
    },
    {
      'title': 'Buy 1 Get 1 Free',
      'description': 'Buy one and get another absolutely free! Only on selected items.',
      'image': 'assets/images/Offers/r257-burger-Steers-2021-09-79.png',
      'validity': 'Valid till: 15th Oct 2024',
    },
    {
      'title': 'Free Delivery',
      'description': 'Enjoy free delivery on all orders above \$20.',
      'image': 'assets/images/Offers/Screenshot 2024-09-29 233400.png',
      'validity': 'Valid till: 31st Dec 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Special Offers'),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(() => MyHomePage());
            // Navigates back to the previous screen
          },
        ),
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      offer['image'],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          offer['title'],
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          offer['description'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          offer['validity'],
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Add your action here for claiming the offer
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${offer['title']} claimed!"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Claim Offer'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Add your action here to show offer details
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('View Details'),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
