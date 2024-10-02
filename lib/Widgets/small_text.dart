import 'package:flutter/material.dart';

class SmallText extends StatefulWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;

  const SmallText({
    super.key,
    required this.text,
    this.height = 1.2,
    this.size = 13,
    this.color = Colors.black54,
  });

  @override
  State<SmallText> createState() => _SmallTextState();
}

class _SmallTextState extends State<SmallText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        height: widget.height,
        fontFamily: 'Roboto', // Ensure this matches your font definition in pubspec.yaml
        color: widget.color,
        fontSize: widget.size,
      ),
    );
  }
}
