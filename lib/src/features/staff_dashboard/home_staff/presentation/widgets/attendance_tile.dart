import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class AttendanceTile extends StatefulWidget {
  final int presentCount;
  final int absentCount;

  const AttendanceTile({
    super.key,
    required this.presentCount,
    required this.absentCount,
  });

  @override
  _AttendanceTileState createState() => _AttendanceTileState();
}

class _AttendanceTileState extends State<AttendanceTile> {
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
                inputText: widget.presentCount.toString(),
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
                inputText: widget.absentCount.toString(),
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
