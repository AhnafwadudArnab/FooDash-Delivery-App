import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/dimensions.dart';
import '../../Home_pages/BottomNavigationButtons.dart';
import 'Favourite_page.dart';
import 'Order_page.dart';

class Settings_page extends StatefulWidget {
  const Settings_page({super.key});

  @override
  _Settings_pageState createState() => _Settings_pageState();
}

class _Settings_pageState extends State<Settings_page> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.brown,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.offAll(() => const MyHomePage());
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimension.height52),
          Text(
            'Manage Your FooDash Account',
            style: TextStyle(fontSize: Dimension.font20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Dimension.height130),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              children: [
                _buildOrdersTile(),
                _buildmyRatingsTile(),
                _buildAddressesTile(),
                _buildPayment_MethodsTile(),
                _buildHelp_SupportTile(),
                _buildAdminPanelTile(),
              ],
            ),
          ),
          SizedBox(height: Dimension.height52),
          // Adding the Dark Mode Toggle at the bottom
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(fontSize: Dimension.font15, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                      Get.changeTheme(
                        isDarkMode ? ThemeData.dark() : ThemeData.light(),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ],
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
          Get.offAll(() => const OrdersScreen());
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.history, size: 40), // Admin icon
              const SizedBox(height: 5),
              Text('My Orders', style: TextStyle(fontSize: Dimension.font15)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildmyRatingsTile() {
    return Card(
      child: InkWell(
        onTap: () {
          Get.offAll(() => const FavouritesScreen());
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite, size: 40), // Admin icon
              const SizedBox(height: 5),
              Text('My Ratings', style: TextStyle(fontSize: Dimension.font15)),
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
          // Navigate to Payment Methods functionality here
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.payment, size: Dimension.iconsize50), // Admin icon
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
         // Get.offAll(()=>const AddressPage());
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

  Widget _buildHelp_SupportTile() {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigate to Help & Support functionality here
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.help, size: 50), // Admin icon
              const SizedBox(height: 5),
              Text('Help & Support', style: TextStyle(fontSize: Dimension.font15)),
            ],
          ),
        ),
      ),
    );
  }
}
