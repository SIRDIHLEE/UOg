
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';

import '../../common/custom_text.dart';

class WhatIsHappeningWidget extends StatelessWidget {
  const WhatIsHappeningWidget({
    super.key, required this.heading, required this.date, required this.subtext, required this.image,
  });
  final String heading, date, subtext;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.0.sp),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
              child: image,
              ),
              SizedBox(height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    inputText: heading,
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    weight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                  CustomText(
                    inputText: date,
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    weight: FontWeight.w400,
                    color: AppColors.textColor1,
                  ),

              ],),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    inputText: subtext,
                    textAlign: TextAlign.start,
                    fontSize: 12,
                    weight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}