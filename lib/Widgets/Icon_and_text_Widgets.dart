import 'package:flutter/material.dart';
import 'small_text.dart';
class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTextWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor, // Apply the iconColor here
          size: 24, // You can adjust the size if needed
        ),

        SmallText(text: text),
      ],
    );
  }
}
