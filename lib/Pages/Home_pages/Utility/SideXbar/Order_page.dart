import 'package:FooDash_App/Pages/Downbar/BottomNavigationButtons.dart';
import 'package:FooDash_App/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Downbar/Profilebar.dart';
class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              Get.offAll(() => MyHomePage());
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Past orders',
            style: TextStyle(
              fontSize: Dimension.font15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Dimension.height15),
          OrderCard(
            restaurantName: 'Sub Lover\'s - Police Plaza',
            deliveryDate: 'Delivered on 28 Aug 20:56',
            item: 'Chicken Sub Marine Sandwich',
            price: 'Tk 233',
            imageUrl: 'assets/images/Orders/sub_lover.png', // Placeholder for the image
          ),
          OrderCard(
            restaurantName: 'Mashallah Lacchi & Snacks - Badda',
            deliveryDate: 'Delivered on 17 Nov 19:54',
            item: 'Chicken Sub Sandwich',
            price: 'Tk 199',
            imageUrl: 'assets/images/Orders/burger.png', // Placeholder for the image
          ),
          OrderCard(
            restaurantName: 'CAFFIX XPRESS CAFE',
            deliveryDate: 'Delivered on 11 Jun 21:30',
            item: 'Naga Chicken Burger',
            price: 'Tk 138',
            imageUrl: 'assets/images/Orders/Pizza.png', // Placeholder for the image
          ),
        ],
      ),
    );
  }
}

// Order Card Widget
class OrderCard extends StatelessWidget {
  final String restaurantName;
  final String deliveryDate;
  final String item;
  final String price;
  final String imageUrl;

  const OrderCard({
    required this.restaurantName,
    required this.deliveryDate,
    required this.item,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              width: Dimension.width45,
              height: Dimension.height45,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Dimension.height3),
                  Text(deliveryDate),
                  SizedBox(height: Dimension.height3),
                  Text(item),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Dimension.height8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Select items to reorder'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
