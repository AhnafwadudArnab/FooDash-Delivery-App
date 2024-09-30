import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helping_hands/Theme_controllers.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous page
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Dark mode'),
            trailing: Obx(() {
              return Switch(
                value: themeController.themeMode.value == ThemeMode.dark,
                onChanged: (bool isDarkMode) {
                  themeController.toggleTheme(isDarkMode); // Toggle the theme
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
