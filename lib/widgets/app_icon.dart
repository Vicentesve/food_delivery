import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? size;
  const AppIcon(
      {super.key,
      required this.icon,
      this.bgColor = const Color(0xfffcf4e4),
      this.iconColor = const Color(0xff756d54),
      this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        //borderRadius: BorderRadius.circular(size! / 2).r,
        color: bgColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16.h,
      ),
    );
  }
}
