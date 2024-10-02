import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/main.dart';

class CartXControllerS extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs; // Observable list of cart items

  void addToCart(Map<String, dynamic> foodItem, int quantity) {
    // Check if item already exists in the cart
    final existingItem = cartItems.firstWhere(
          (item) => item['name'] == foodItem['name'],
      orElse: () => {},
    );

    if (existingItem.isNotEmpty) {
      // Update quantity if item exists
      existingItem['quantity'] += quantity;
    } else {
      // Add new item to cart
      cartItems.add({
        ...foodItem, // Spread operator to copy the foodItem details
        'quantity': quantity, // Add quantity
      });
    }
  }

  void removeFromCart(String foodName) {
    cartItems.removeWhere((item) => item['name'] == foodName);
  }

  int get totalItems => cartItems.length;

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] as double) * item['quantity']);
  }

  void placeOrder(String text, String text2) {}

  getDatabaseValue() {}

}

void main() {
  Get.put(CartXControllerS()); // Register the CartController
  runApp(const MyApp());
}
