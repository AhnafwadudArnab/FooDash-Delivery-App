import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/dimensions.dart';
import '../../Home_pages/BottomNavigationButtons.dart'; // Add this package for sharing functionality

class InviteFriendsPage extends StatelessWidget {
  const InviteFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite Friends'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(const MyHomePage());// Navigate back when the button is pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Invite your friends to join us!',
              style: TextStyle(fontSize: Dimension.font26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Share this link with your friends and earn rewards when they join!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _shareAppLink();
              },
              child: const Text('Share App Link'),
            ),
          ],
        ),
      ),
    );
  }

  void _shareAppLink() {
    // ignore: unused_local_variable
    const String appLink = 'https://example.com'; // Replace with your app link
    //Share.share('Check out this awesome app: $appLink');
  }
}
