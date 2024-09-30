import 'package:get/get.dart';

// Model class for Food Item
class FoodItem {
  final String image;
  final String name;
  final double price; // Use double for price calculations
  final String description;

  FoodItem({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
}

class CartController extends GetxController {
  var foodList = <FoodItem>[].obs; // Observable list of food items in the cart
  var totalPrice = 0.0.obs; // Observable total price

  // Adds a food item to the cart (with optional duplicate handling)
  void addToCart(FoodItem item) {
    // Optional: Prevent adding duplicates (can be removed if duplicates are allowed)
    if (foodList.contains(item)) {
      Get.snackbar('Item Already in Cart', '${item.name} is already in your cart.');
    } else {
      foodList.add(item);
      calculateTotalPrice();
    }
  }

  // Removes a food item from the cart
  void removeFromCart(FoodItem item) {
    foodList.remove(item);
    calculateTotalPrice();
  }

  // Clears the cart
  void clearCart() {
    foodList.clear();
    totalPrice.value = 0.0;
  }

  // Calculates the total price of items in the cart
  void calculateTotalPrice() {
    totalPrice.value = foodList.fold(0.0, (sum, item) => sum + item.price);
  }

  // Fetches the current cart data from a database (simulated, replace with Firebase or API call)
  Future<void> getDatabaseValue() async {
    // Simulate fetching from a database, replace with actual code
    await Future.delayed(const Duration(seconds: 1));

    // Example: Add some dummy data after fetching
    foodList.add(FoodItem(
      image: "assets/images/burger.png", // Replace with actual image path
      name: "Burger",
      price: 150.0, // Double for price
      description: "A delicious burger with cheese and lettuce.",
    ));
    foodList.add(FoodItem(
      image: "assets/images/pizza.png", // Replace with actual image path
      name: "Pizza",
      price: 300.0, // Double for price
      description: "A classic pepperoni pizza.",
    ));

    calculateTotalPrice(); // Update total price after fetching data
  }

  // Place an order and upload to Firebase (replace with actual Firebase logic)
  Future<void> placeOrder(String name, String address) async {
    if (foodList.isEmpty) {
      Get.snackbar('Error', 'Cart is empty! Add some items before placing an order.');
      return;
    }

    try {
      // Simulate order placement, replace with Firebase API call
      await Future.delayed(const Duration(seconds: 2));

      // Log the order (replace with actual Firebase logic)
      print('Order placed for $name at $address with total price: ${totalPrice.value}');

      // Show success message
      Get.snackbar('Order Placed', 'Your order has been placed successfully!');

      // Clear cart after placing the order
      clearCart();
    } catch (error) {
      Get.snackbar('Error', 'Failed to place order. Please try again.');
      print('Error placing order: $error');
    }
  }

  // Get the quantity of a specific food item in the cart
  int getQuantity(FoodItem item) {
    return foodList.where((food) => food.name == item.name).length;
  }

  // Check if an item is already in the cart
  bool isInCart(FoodItem item) {
    return foodList.any((food) => food.name == item.name);
  }
}
