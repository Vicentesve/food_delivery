import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final double? height;

  const SmallText({
    super.key,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.size = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Dimensions.getHeight(size),
        color: color,
        fontFamily: 'Roboto',
        height: height,
      ),
    );
  }
}
