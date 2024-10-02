import 'package:FooDash_App/Pages/Downbar/BottomNavigationButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/dimensions.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {Get.to(const MyHomePage()); // Navigate back when the button is pressed
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Title Section
          Text(
            'Your Rewards',
            style: TextStyle(fontSize: Dimension.font15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),

          // List of Rewards
          _buildRewardCard(
            context,
            title: '10% Discount on Next Purchase',
            description: 'Use this coupon for a 10% discount on your next order.',
            pointsRequired: 100,
          ),
          _buildRewardCard(
            context,
            title: 'Free Shipping',
            description: 'Enjoy free shipping on your next purchase.',
            pointsRequired: 200,
          ),
          _buildRewardCard(
            context,
            title: 'Gift Voucher of \$20',
            description: 'Redeem this voucher for any purchase.',
            pointsRequired: 300,
          ),
          _buildRewardCard(
            context,
            title: 'Exclusive Access to New Products',
            description: 'Get exclusive early access to our new arrivals.',
            pointsRequired: 400,
          ),
        ],
      ),
    );
  }

  Widget _buildRewardCard(BuildContext context, {
    required String title,
    required String description,
    required int pointsRequired,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: Dimension.font17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(description),
            const SizedBox(height: 8.0),
            Text(
              'Points Required: $pointsRequired',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Handle redemption logic here
                _showRedemptionDialog(context, title);
              },
              child: const Text('Redeem'),
            ),
          ],
        ),
      ),
    );
  }

  void _showRedemptionDialog(BuildContext context, String rewardTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Redeem Reward'),
          content: Text('Are you sure you want to redeem "$rewardTitle"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform redemption logic here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$rewardTitle redeemed successfully!'),
                  ),
                );
              },
              child: const Text('Redeem'),
            ),
          ],
        );
      },
    );
  }
}
