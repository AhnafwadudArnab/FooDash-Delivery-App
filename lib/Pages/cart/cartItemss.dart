import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Cart_Controllers.dart';


class CartItems extends StatelessWidget {
  final FoodItem foodItem; // Assuming FoodItem is your model class for the food item

  const CartItems(this.foodItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          // Image of the food item
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset("assets/images/topmenu/ic_burger.png", // Assuming the image path is stored in the FoodItem model
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10.0),
          // Food item details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodItem.name, // Food item name
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "${foodItem.price} Rs.", // Food item price
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Remove button
          IconButton(
            icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
            onPressed: () {
              // Call a function to remove the item from the cart
              Get.find<CartController>().clearCart(); // Ensure you have a removeFoodItem method in your CartController
            },
          ),
        ],
      ),
    );
  }
}
