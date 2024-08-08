import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
        required this.inputText,
         required this.fontSize,
        required this.weight,
        required this.color,
         this.fontFamily,
        this.softWrap,
        this.letterSpacing,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.fontStyle = FontStyle.normal});

  final String inputText;
  final double fontSize;
  final FontWeight weight;
  final Color color;
   String? fontFamily;
  bool? softWrap;
  double? letterSpacing;
  TextAlign? textAlign;
  FontStyle? fontStyle;
  TextOverflow? overflow;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.montserrat(
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: weight,
          color: color),
    );
  }
}
