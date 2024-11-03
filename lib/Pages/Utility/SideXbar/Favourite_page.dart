import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Home_pages/BottomNavigationButtons.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
        centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAll(() => const MyHomePage());
              // Navigates back to the previous screen
            },
          ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/foodash service icon.png', // Placeholder for the image
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 16),
              const Text(
                'No favourites saved',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'To make ordering even faster, you\'ll find all your faves here. Just look for the heart icon!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(() => const MyHomePage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Let\'s find some favourites'),
              )
            ],
          ),
        ),
      ),
    );
  }
}