import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Home_pages/Utility/SideXbar/newCArtPg.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(()=>const Mycart_Page());
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Your orders will be displayed here.'),
      ),
    );
  }
}
