
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';
import '../../Home_pages/BottomNavigationButtons.dart';

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

   OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Special Offers'),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(() => const MyHomePage());
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
                    borderRadius:  const BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      offer['image'],
                      height: Dimension.height180,
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
                            fontSize: Dimension.font20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: Dimension.height10),
                        Text(
                          offer['description'],
                          style: TextStyle(
                            fontSize: Dimension.font15,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: Dimension.height10),
                        Text(
                          offer['validity'],
                          style:TextStyle(
                            fontSize: Dimension.font15,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(height: Dimension.height15),
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
                              child: const Text('Claim Offer'),
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
                              child: const Text('View Details'),
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
