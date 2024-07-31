import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/custom_text.dart';
import '../../../constant/colors.dart';

class IdCardScreen extends StatelessWidget {
  const IdCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/student_profile.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 135.h),
              ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Image.asset(
                'assets/images/Ellipse 255.png',
                height: 120.h,
                width: 120.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 85.h),
            CustomText(
              inputText: "JOE MIKE",
              textAlign: TextAlign.start,
              fontSize: 24,
              weight: FontWeight.w700,
              color: AppColors.scaffoldBackground,
            ),
            SizedBox(height: 11.h),
            CustomText(
              inputText: 'Student'.toUpperCase(),
              textAlign: TextAlign.start,
              fontSize: 11,
              weight: FontWeight.w600,
              color: AppColors.scaffoldBackground,
            ),
            SizedBox(height: 28.h),
            CustomText(
              inputText: 'ID No: 0123456789',
              textAlign: TextAlign.start,
              fontSize: 15,
              weight: FontWeight.w500,
              color: AppColors.scaffoldBackground,
            ),
            SizedBox(height: 11.h),
            CustomText(
              inputText: 'Department: Science & Engineering',
              textAlign: TextAlign.start,
              fontSize: 15,
              weight: FontWeight.w500,
              color: AppColors.scaffoldBackground,
            ),
            SizedBox(height: 11.h),
            CustomText(
              inputText: 'Institution: University of Greenwich',
              textAlign: TextAlign.start,
              fontSize: 15,
              weight: FontWeight.w500,
              color: AppColors.scaffoldBackground,
            ),
            SizedBox(height: 68.h),
            Container(
              height: 69.h,
              width: 287.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Image.asset('assets/images/Group 50.png'),
            ),
          ],
        ),
      ),
    );
  }
}
