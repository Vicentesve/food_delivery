import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overFlow;

  const BigText(
      {super.key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.size = 20,
      this.overFlow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: 1,
      style: GoogleFonts.inter(
        fontSize: size.sp,
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
