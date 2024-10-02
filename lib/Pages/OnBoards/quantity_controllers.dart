
import 'package:flutter/material.dart';

// Assuming you have these classes defined elsewhere in your project
// import 'your_app_colors.dart';
// import 'your_big_text_widget.dart';

class YourWidget extends StatefulWidget {
  const YourWidget({super.key});

  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  int _quantity = 1; // Initial quantity

  // Build the quantity control
  Container _buildQuantityControl() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0, // Use a fixed value or use Dimension.height20
        horizontal: 20.0, // Use a fixed value or use Dimension.width20
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0), // Use Dimension.radius20 if defined
        color: Colors.white,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (_quantity > 1) {
                setState(() {
                  _quantity--; // Decrement quantity
                });
              }
            },
            child: const Icon(Icons.remove, color: Colors.red), // Replace AppColor.signColor if needed
          ),
          const SizedBox(width: 10),
          BigText(text: "$_quantity"), // Display the current quantity
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                _quantity++; // Increment quantity
              });
            },
            child: const Icon(Icons.add, color: Colors.green), // Replace AppColor.titleColor if needed
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quantity Control'),
      ),
      body: Center(
        child: _buildQuantityControl(),
      ),
    );
  }
}

// Dummy class for BigText, replace it with your actual implementation
class BigText extends StatelessWidget {
  final String text;
  const BigText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
