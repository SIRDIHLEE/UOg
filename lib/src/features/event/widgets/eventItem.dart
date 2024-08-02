
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';

import '../../../common/custom_text.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key, required this.heading, required this.date, required this.subtext, required this.image, required this.time, required this.image2,
  });
 final String heading, date, subtext, time;
  final Image image, image2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 150,
        decoration: BoxDecoration(
          color: AppColors.textColor,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding:  EdgeInsets.all(13.0.sp),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                inputText: heading,
                textAlign: TextAlign.start,
                fontSize: 18,
                weight: FontWeight.w600,
                color: AppColors.textColor3,
              ),
              SizedBox(height: 2.h,),
              CustomText(
                inputText: subtext,
                textAlign: TextAlign.start,
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.openday,
              ),

          SizedBox(height: 13.h,),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Row(
              children: [
              // Image.asset(image, height: 20,),
              image ,
              SizedBox(width: 4.w,),
                CustomText(
                  inputText: date,
                  textAlign: TextAlign.start,
                  fontSize: 14,
                  weight: FontWeight.w400,
                  color: AppColors.openday,
                ),
            ],
            ),
              Row(
              children: [
              // Image.asset("assets/images/clock.png", height: 20,),
              image2,
              SizedBox(width: 4.w,),
                CustomText(
                  inputText: time,
                  textAlign: TextAlign.start,
                  fontSize: 12,
                  weight: FontWeight.w400,
                  color: AppColors.openday,
                ),
            ],
            ),
            ],)
          ],
          
          
          ),
        ),
      ),
    );
  }
}