import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uog/src/constant/colors.dart';

class AttendanceItem extends StatelessWidget {
  const AttendanceItem({super.key, required this.title,  required this.subtitle, required this.percentage, required this.count, required this.status,});
  final String title, subtitle, percentage, count, status;
  @override
  Widget build(BuildContext context) {
    return  Container(
      // height: 65,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10)

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/courseImg.png",
                  height: 32.h,
                  width: 32.w,
                  color: AppColors.textColor,
                ),                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(title, style: const TextStyle(color: AppColors.textColor, fontSize: 14, fontWeight: FontWeight.w600),),
                  Text(subtitle, style: const TextStyle(color: AppColors.textColor, fontSize: 12, fontWeight: FontWeight.w600)),
                  Text(percentage, style: const TextStyle(color: AppColors.textColor, fontSize: 12, fontWeight: FontWeight.w600)),
                ],)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h,),
                Text(status, style: const TextStyle(color: AppColors.textColor, fontSize: 12, fontWeight: FontWeight.w600)),
                Text(count, style: const TextStyle(color: AppColors.textColor, fontSize: 12, fontWeight: FontWeight.w600)),
              ],),
            )
          ],
        ),
      ),
    );
  }
}