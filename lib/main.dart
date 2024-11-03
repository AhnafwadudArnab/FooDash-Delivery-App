import 'package:flutter/material.dart';
import 'package:fooduu/Pages/Home_pages/BottomNavigationButtons.dart';
import 'package:get/get.dart';
import '../Routes/routess.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FooDash',
      theme: ThemeData.light(), // Light theme
      themeMode: ThemeMode.system, // Automatically switch themes based on system setting
      home:  MyHomePage(),
      // home: Onboard(),
      initialRoute: RoutesHelper.initial,
      getPages: RoutesHelper.routes,
    );
  }
}