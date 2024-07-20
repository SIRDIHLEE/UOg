import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class OpenDayText extends StatelessWidget {
  const OpenDayText({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return   Text(text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor
                ),);
  }
}