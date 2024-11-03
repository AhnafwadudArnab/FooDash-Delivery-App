import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';
import '../../Home_pages/BottomNavigationButtons.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(const MyHomePage()); // Navigate back when the button is pressed
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: Dimension.font26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          _buildFAQTile(
            context,
            question: 'How do I reset my password?',
            answer: 'To reset your password, go to the login screen and click on "Forgot Password". Follow the instructions sent to your email.',
          ),
          _buildFAQTile(
            context,
            question: 'How can I contact support?',
            answer: 'You can contact our support team by clicking on the "Contact Support" button below.',
          ),
          _buildFAQTile(
            context,
            question: 'Where can I find my order history?',
            answer: 'Your order history can be found in the "Orders" section of your profile.',
          ),
          const SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              _contactSupport(context);
            },
            child: const Text('Contact Support'),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQTile(BuildContext context, {required String question, required String answer}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(answer),
          ),
        ],
      ),
    );
  }

  void _contactSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contact Support'),
          content: const Text('You can reach us at support@example.com'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
