import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../Home_pages/Utility/SideXbar/AddressBAr_page.dart';
import '../Home_pages/Utility/SideXbar/Darkmode_page.dart';
import '../Home_pages/Utility/SideXbar/Favourite_page.dart';
import '../Home_pages/Utility/SideXbar/Order_page.dart';
import '../OnBoards/Onboard.dart';
import 'BottomNavigationButtons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.offAll(() => const MyHomePage());
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimension.height10),
          CircleAvatar(
            radius: Dimension.radius35,
            backgroundColor: Colors.purple[200],
            backgroundImage: const AssetImage('assets/icons/user-139.png'), // Replace with your image path
          ),
          SizedBox(height: Dimension.height8),
          Text(
            'Username',
            style: TextStyle(fontSize: Dimension.font20, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Food Lover',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: Dimension.height20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              children: [
                _buildOrdersTile(),
                _buildPayment_MethodsTile(),
                _buildAddressesTile(),
                _buildSettingsTile(),
                _buildHelp_SupportTile(),
                _buildFavoritesTile(),
                _buildAdminPanelTile(),
                _buildLogoutTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildLogoutTile() {
    return Card(
      color: Colors.red[200],
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red[200], // Button background color
          elevation: 4, // Button elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
        ),
        onPressed: () {
          Get.offAll(() => const Onboard());
        },
        child: const Text(
          'Logout', // Text for the button
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildAdminPanelTile() {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigate to Admin Panel functionality here
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.admin_panel_settings_rounded, size: 40), // Admin icon
              const SizedBox(height: 5),
              Text('Admin Panel', style: TextStyle(fontSize: Dimension.font15)),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildOrdersTile() {
    return Card(
      child: InkWell(
        onTap: () {
          Get.offAll(() => OrdersScreen());
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.history, size: 40), // Admin icon
              const SizedBox(height: 5),
              Text('Orders', style: TextStyle(fontSize: Dimension.font15)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritesTile() {
    return Card(
      child: InkWell(
        onTap: () {
          Get.offAll(() => FavouritesScreen());
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite, size: 40), // Admin icon
              const SizedBox(height: 5),
              Text('Favorites', style: TextStyle(fontSize: Dimension.font15)),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildPayment_MethodsTile() {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigate to Admin Panel functionality here
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.payment, size: 40), // Admin icon
              const SizedBox(height: 5),
              Text('Payment Methods', style: TextStyle(fontSize: Dimension.font15)),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildAddressesTile() {
    return Card(
      child: InkWell(
        onTap: () {
          Get.offAll(()=>AddressPage());
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, size: 40), // Admin icon
              const SizedBox(height: 5),
              Text('Addresses', style: TextStyle(fontSize: Dimension.font15)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile() {
    return Card(
      child: InkWell(
        onTap: () {
          //Get.offAll(() =>  Mode_page());
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.settings, size: 40), // Admin icon
              const SizedBox(height: 5),
              Text('Settings', style: TextStyle(fontSize: Dimension.font15)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelp_SupportTile() {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigate to Admin Panel functionality here
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.help, size: 40), // Admin icon
              SizedBox(height: 5),
              Text('Help & Support', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
