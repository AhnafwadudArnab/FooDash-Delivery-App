import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';
import '../../../Downbar/BottomNavigationButtons.dart';

class Mycart_Page extends StatefulWidget {
  const Mycart_Page({super.key});

  @override
  _Mycart_PageState createState() => _Mycart_PageState();
}

class _Mycart_PageState extends State<Mycart_Page> {
  // List to hold quantities and product prices
  List<int> quantities = [1, 1, 1];
  List<double> prices = [240, 140, 550];
  List<String> productNames = ['Rice bowl', 'Avocado Salad', 'Pizza!'];
  List<String> imageUrls = [
    'assets/images/bestfood/ic_best_food_1.jpeg',
    'assets/images/bestfood/ic_best_food_2.jpeg',
    'assets/images/bestfood/ic_best_food_5.jpeg',
  ];

  // Method to calculate the total price
  double getTotalPrice() {
    double total = 0;
    for (int i = 0; i < quantities.length; i++) {
      total += quantities[i] * prices[i];
    }
    return total;
  }

  // Method to handle quantity changes from OrderCard
  void updateQuantity(int index, int newQuantity) {
    setState(() {
      quantities[index] = newQuantity;
    });
  }

  // Method to handle item removal
  void removeItem(int index) {
    setState(() {
      quantities.removeAt(index);
      prices.removeAt(index);
      productNames.removeAt(index);
      imageUrls.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              Get.offAll(() => const MyHomePage());
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Items in your cart:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Dimension.height15),
          for (int i = 0; i < productNames.length; i++)
            OrderCard(
              productName: productNames[i],
              price: prices[i],
              imageUrl: imageUrls[i],
              quantity: quantities[i],
              onQuantityChanged: (newQuantity) => updateQuantity(i, newQuantity),
              onRemove: () => removeItem(i),
            ),
          const SizedBox(height: 20),
          // Total and Place Order Button
          Text(
            'Total: ${getTotalPrice().toStringAsFixed(2)}tk',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: Dimension.height15),
          ElevatedButton(
            onPressed: () {
              // Handle order placement logic here
              Get.snackbar('Order Placed', 'Your order has been placed successfully!');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(
              'Place Order',
              style: TextStyle(fontSize: Dimension.font17),
            ),
          ),
        ],
      ),
    );
  }
}

// Stateful Order Card Widget to handle quantity change and removal
class OrderCard extends StatefulWidget {
  final String productName;
  final double price;
  final String imageUrl;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  const OrderCard({
    super.key,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
      widget.onQuantityChanged(quantity);
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        widget.onQuantityChanged(quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.price * quantity;

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              widget.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
             SizedBox(width: Dimension.width15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimension.font17,
                    ),
                  ),
                   SizedBox(height: Dimension.height8),
                  Text('Price: ${widget.price.toStringAsFixed(2)}tk'),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decreaseQuantity,
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: Dimension.font17),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: increaseQuantity,
                    ),
                  ],
                ),
                Text(
                  'Total: ${totalPrice.toStringAsFixed(2)}tk',
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimension.font17,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: widget.onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
