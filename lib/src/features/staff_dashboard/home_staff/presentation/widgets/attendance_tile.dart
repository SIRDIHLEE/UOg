import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';
class AttendanceTile extends StatelessWidget {
  const AttendanceTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 73.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                inputText: '01',
                textAlign: TextAlign.start,
                fontSize: 30,
                weight: FontWeight.w600,
                color: AppColors.absentTColor,
              ),
              CustomText(
                inputText: 'Present',
                textAlign: TextAlign.start,
                fontSize: 12,
                weight: FontWeight.w500,
                color: AppColors.blackColor.withOpacity(0.20),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w,),
        Container(
          height: 73.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                inputText: '00',
                textAlign: TextAlign.start,
                fontSize: 30,
                weight: FontWeight.w600,
                color: AppColors.redColor,
              ),
              CustomText(
                inputText: 'Absent',
                textAlign: TextAlign.start,
                fontSize: 12,
                weight: FontWeight.w500,
                color: AppColors.blackColor.withOpacity(0.20),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
