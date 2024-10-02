import 'package:flutter/material.dart';
class DarkTheme extends StatefulWidget {
  const DarkTheme({super.key});

  @override
  _DarkThemeState createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Dark_theme_Settings(
        isDarkMode: isDarkMode,
        onThemeChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }
}

class Dark_theme_Settings extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const Dark_theme_Settings({super.key, required this.isDarkMode, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          // Existing buttons and settings above this
          // Add your six buttons and settings here

          const Spacer(), // To push the toggle to the bottom

          // Dark mode toggle switch in the red box area
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dark Mode"),
                Switch(
                  value: isDarkMode,
                  onChanged: onThemeChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
