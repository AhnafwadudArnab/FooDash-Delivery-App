import 'package:flutter/cupertino.dart';
import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;  // Text should be a required positional parameter
  final double size;
  final TextOverflow textOverflow;

  const BigText({
    super.key,
    required this.text,  // `required` ensures this is passed
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis,
    this.color = const Color(0xFF332d2b),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'ROBOTO',
        color: color,
        fontSize: size == 0 ? Dimension.font20 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
