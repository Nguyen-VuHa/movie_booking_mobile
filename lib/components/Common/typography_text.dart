import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/constants/color_constants.dart';

class TypographyText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

 const TypographyText(
    this.text, { 
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines,
      overflow: overflow, 
      style: TextStyle(
        color: color ?? AppColors.infoColor,
        fontSize: fontSize ?? 16.0,
        fontWeight: fontWeight ?? FontWeight.normal,
       
      ),
    );
  }
}
