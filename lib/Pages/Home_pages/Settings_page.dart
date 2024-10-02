import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helping_hands/Theme_controllers.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous page
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dark mode'),
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
