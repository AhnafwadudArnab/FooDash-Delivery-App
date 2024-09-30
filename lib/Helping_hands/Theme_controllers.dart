import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Rx object to hold the current ThemeMode (light or dark)
  var themeMode = ThemeMode.light.obs;

  // Function to toggle between light and dark theme
  void toggleTheme(bool isDarkMode) {
    themeMode.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
ThemeData customDarkTheme = ThemeData(
  brightness: Brightness.dark, // Set brightness to dark
  primaryColor: Colors.teal, // Example of primary color
  scaffoldBackgroundColor: Color(0xFF121212), // Dark grey background instead of full black
  appBarTheme: AppBarTheme(
    color: Color(0xFF1F1F1F), // Slightly lighter grey for AppBar
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.teal,
    secondary: Colors.tealAccent,
  ),
  cardColor: Color(0xFF1E1E1E), // Color for cards and containers
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
);
