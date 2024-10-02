import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Helping_hands/Theme_controllers.dart';
import '../Pages/Downbar/BottomNavigationButtons.dart';
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
      darkTheme: customDarkTheme, // Custom dark theme
      themeMode: ThemeMode.system, // Automatically switch themes based on system setting
      home: const MyHomePage(),
     // home: Onboard(),
      initialRoute: RoutesHelper.initial,
      getPages: RoutesHelper.routes,
    );
  }
}
