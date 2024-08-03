import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class HomeDateCard extends StatelessWidget {
  const HomeDateCard({
    super.key, required this.date, required this.degree,
  });

  final String date;
  final String degree;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.maxFinite,
      decoration:   BoxDecoration(
          image: const DecorationImage(image: AssetImage('assets/images/Rectangle 27.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.sp),
            bottomRight: Radius.circular(10.sp),
          )
      ),
      child: Padding(
        padding:  EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 193.h,),
            CustomText(
              inputText: date??'Thursday, Aug 01',
              textAlign: TextAlign.center,
              fontSize: 14,
              weight: FontWeight.w500,
              color: AppColors.navColor,
            ),
            CustomText(
              inputText: "Good Morning!",
              textAlign: TextAlign.center,
              fontSize: 24,
              weight: FontWeight.w700,
              color: AppColors.navColor,
            ),
            SizedBox(height: 6.h,),
            CustomText(
              inputText: "$degree | Mostly Cloudly | feels like 15ºC",
              textAlign: TextAlign.center,
              fontSize: 14,
              weight: FontWeight.w500,
              color: AppColors.navColor,
            ),
          ],
        ),
      ),
    );
  }
}
