import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/constant/route.dart';

import '../../../../../common/custom_text.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: SingleChildScrollView(
      padding:  EdgeInsets.fromLTRB(10.w, 44.h, 10.w, 0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,Routes.busService);
            },
            child: Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.bBColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 171.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                      child: Image.asset(
                        'assets/images/Rectangle 49.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 200.h,
                      ),
                    ),
                  ),
                  Padding(
                  padding: EdgeInsets.only(left: 4.0.w),
                  child: CustomText(
                    inputText: 'University bus service ',
                    textAlign: TextAlign.start,
                    fontSize: 15,
                    weight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
              ],),
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 240.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                      color: AppColors.bBColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 214.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                            ),
                            child: Image.asset(
                              'assets/images/Rectangle 50.png',
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: 214.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0.w),
                          child: CustomText(
                            inputText: 'Activities',
                            textAlign: TextAlign.start,
                            fontSize: 15,
                            weight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],),
                  ),
                  SizedBox(height: 9.h,),
                  Container(
                    height: 110.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: AppColors.bBColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 84.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                            ),
                            child: Image.asset(
                              'assets/images/Rectangle 53 (1).png',
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: 84.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0.w),
                          child: CustomText(
                            inputText: 'Virtual tours',
                            textAlign: TextAlign.start,
                            fontSize: 15,
                            weight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Container(
                    height: 110.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: AppColors.bBColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 84.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r),
                            ),
                            child: Image.asset(
                              'assets/images/Rectangle 51 (1).png',
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: 84.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0.w),
                          child: CustomText(
                            inputText: 'Resources',
                            textAlign: TextAlign.start,
                            fontSize: 15,
                            weight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],),
                  ),
                  SizedBox(height: 9.h,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.openDay);
                    },
                    child: Container(
                      height: 240.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: AppColors.bBColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 214.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.blackColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r),
                              ),
                              child: Image.asset(
                                'assets/images/Rectangle 52 (1).png',
                                width: double.infinity,
                                fit: BoxFit.cover,
                                height: 214.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.0.w),
                            child: CustomText(
                              inputText: 'Open days',
                              textAlign: TextAlign.start,
                              fontSize: 15,
                              weight: FontWeight.w500,
                              color: AppColors.textColor,
                            ),
                          ),
                        ],),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Routes.careerScreen);
            },
            child: Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.bBColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 171.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                      child: Image.asset(
                        'assets/images/Rectangle 54.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 200.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.0.w),
                    child: CustomText(
                      inputText: 'Careers',
                      textAlign: TextAlign.start,
                      fontSize: 15,
                      weight: FontWeight.w500,
                      color: AppColors.textColor,
                    ),
                  ),
                ],),
            ),
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    ),
    );
  }
}