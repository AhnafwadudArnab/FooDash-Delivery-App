import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/dimensions.dart';
import '../../Home_pages/Utility/SideXbar/Address_page.dart';
import '../../Home_pages/Utility/SideXbar/Favourite_page.dart';
import '../../Home_pages/Utility/SideXbar/Payment.dart';
import '../../Home_pages/Utility/SideXbar/SettingsBar.dart';
import '../../Home_pages/Utility/SideXbar/help_center_page.dart';
import '../../OnBoards/Onboard.dart';
import '../BottomNavigationButtons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Track the selected tile
  String? _selectedTile;

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
            backgroundColor: Colors.blueGrey,
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
            child: ListView(
              padding: const EdgeInsets.all(9),
              children: [
                _buildTileWithSpacing(_buildFavoritesTile()),
                _buildTileWithSpacing(_buildAddressesTile()),
                _buildTileWithSpacing(_buildPaymentMethodsTile()),
                _buildTileWithSpacing(_buildSettingsTile()),
                _buildTileWithSpacing(_buildHelpSupportTile()),
                _buildTileWithSpacing(_buildLogoutTile()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to change color when a tile is clicked
  Color _getTileColor(String tileName) {
    return _selectedTile == tileName ? Colors.purple[100]! : Colors.grey[200]!;
  }

  // Adding vertical spacing between tiles
  Widget _buildTileWithSpacing(Widget tile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0), // Adjust spacing between tiles
      child: tile,
    );
  }

  // Logout Tile
  Widget _buildLogoutTile() {
    return ListTile(
      tileColor: _getTileColor('Logout'),
      leading: Icon(Icons.logout, color: Colors.redAccent[100]),
      title: Text(
        'Logout',
        style: TextStyle(color: Colors.black54, fontSize: Dimension.font17),
      ),
      onTap: () {
        setState(() {
          _selectedTile = 'Logout'; // Set the clicked tile
        });
        Get.offAll(() => const Onboard());
      },
    );
  }

  // Favorites Tile
  Widget _buildFavoritesTile() {
    return _buildCustomTile(
      icon: Icons.favorite,
      label: 'Favorites',
      tileName: 'Favorites',
      onTap: () {
        setState(() {
          _selectedTile = 'Favorites';
        });
        Get.offAll(() => const FavouritesScreen());
      },
    );
  }

  // Payment Methods Tile
  Widget _buildPaymentMethodsTile() {
    return _buildCustomTile(
      icon: Icons.payment,
      label: 'Payment Methods',
      tileName: 'Payment Methods',
      onTap: () {
        setState(() {
          _selectedTile = 'Payment Methods';
        });
        Get.offAll(() => const PaymentPage());
      },
    );
  }

  // Addresses Tile
  Widget _buildAddressesTile() {
    return _buildCustomTile(
      icon: Icons.location_on,
      label: 'Addresses',
      tileName: 'Addresses',
      onTap: () {
        setState(() {
          _selectedTile = 'Addresses';
        });
        Get.offAll(() => const AddressPage());
      },
    );
  }

  // Settings Tile
  Widget _buildSettingsTile() {
    return _buildCustomTile(
      icon: Icons.settings,
      label: 'Settings',
      tileName: 'Settings',
      onTap: () {
        setState(() {
          _selectedTile = 'Settings';
        });
        Get.offAll(() => const Settings_page());
      },
    );
  }

  // Help & Support Tile
  Widget _buildHelpSupportTile() {
    return _buildCustomTile(
      icon: Icons.help,
      label: 'Help & Support',
      tileName: 'Help & Support',
      onTap: () {
        setState(() {
          _selectedTile = 'Help & Support';
        });
        Get.to(() => const HelpCenterPage());
      },
    );
  }

  // Custom Tile for Reusability using ListTile
  Widget _buildCustomTile({
    required IconData icon,
    required String label,
    required String tileName,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.blueGrey), // Adjust icon size and color
      title: Text(
        selectionColor: Colors.black,
        label,
        style: TextStyle(fontSize: Dimension.font15),
      ),
      onTap: onTap,
      tileColor: _getTileColor(tileName), // Get color based on selection
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding for tile content
    );
  }
}
