import 'package:FooDash_App/Pages/Downbar/BottomNavigationButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Sidebarx.dart';

class BecomeVipPage extends StatelessWidget {
  const BecomeVipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Become a VIP!'),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {

            Get.offAll(() => const MyHomePage()); },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/icons/vipbannar.png', // Add your VIP banner image here
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Join the VIP Club!',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Unlock exclusive benefits and rewards by becoming a VIP member. '
                  'Get early access to new features, special discounts, free delivery, and more.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 25),
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  'Exclusive Discounts',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  'Free Delivery on All Orders',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  'Priority Customer Support',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your action for VIP subscription
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Congratulations! You are now a VIP!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Become a VIP!',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
  home: BecomeVipPage(),
));
