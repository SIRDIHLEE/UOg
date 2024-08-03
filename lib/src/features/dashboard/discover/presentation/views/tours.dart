import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uog/src/common/custom_button.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class Tours extends StatefulWidget {
  const Tours({super.key});

  @override
  State<Tours> createState() => _ToursState();
}

class _ToursState extends State<Tours> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
      backgroundColor: AppColors.scaffoldBackground,
      title: CustomText(
        inputText: 'Jobs and Career',
        textAlign: TextAlign.start,
        fontSize: 20,
        weight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      centerTitle: true,
    ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.only(left: 10.0.w,top: 15.h,right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 250.h,
                  width: 163.w,
                  decoration: BoxDecoration(
                    color: AppColors.tourColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 110.h,
                        width: 163.w,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(10.r),topRight: Radius.circular(10.r)),
                          image: const DecorationImage(image: AssetImage('assets/images/Rectangle 53 (1).png',),fit: BoxFit.cover)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: 11.9.w,right: 11.9.w,bottom: 10.h,),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomText(
                                inputText: 'Greenwich Campus Virtual Tour',
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                weight: FontWeight.w700,
                                color: AppColors.scaffoldBackground,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 9.w
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h,),
                            CustomText(
                              inputText: 'Greenwich Campus sits on a UNESCO World Heritage Site on the banks of the River Thames.',
                              textAlign: TextAlign.start,
                              fontSize: 10,
                              weight: FontWeight.w400,
                              color: AppColors.blackColor.withOpacity(0.70),
                            ),
                            SizedBox(height: 19.h,),
                            CustomButton(onPressed: (){},
                            width: 145.w,
                              height: 40.h,
                              title: 'Explore',
                              buttonColor: AppColors.tour,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250.h,
                  width: 163.w,
                  decoration: BoxDecoration(
                    color: AppColors.tourColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 110.h,
                        width: 163.w,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(10.r),topRight: Radius.circular(10.r)),
                          image: const DecorationImage(image: AssetImage('assets/images/image 19.png',),fit: BoxFit.cover)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: 11.9.w,right: 11.9.w,bottom: 10.h,),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomText(
                                inputText: 'Avery Hill Campus Virtual Tour',
                                textAlign: TextAlign.start,
                                fontSize: 12,
                                weight: FontWeight.w700,
                                color: AppColors.scaffoldBackground,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 9.w
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h,),
                            CustomText(
                              inputText: 'Surrounded by green spaces, Avary Hill campus is located in Eltham, South-East London.',
                              textAlign: TextAlign.start,
                              fontSize: 10,
                              weight: FontWeight.w400,
                              color: AppColors.blackColor.withOpacity(0.70),
                            ),
                            SizedBox(height: 19.h,),
                            CustomButton(onPressed: (){},
                            width: 145.w,
                              height: 40.h,
                              title: 'Explore',
                              buttonColor: AppColors.tour,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 21.h,),
            Container(
              // height: 143.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.tourColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child:Padding(
                padding:EdgeInsets.all(8.0.sp),
                child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/image 20.png',height: 119.h,width: 132.w,fit: BoxFit.scaleDown,),
                    SizedBox(width: 6.w,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            inputText: 'Medway Campus Virtual Tour',
                            textAlign: TextAlign.start,
                            fontSize: 12,
                            weight: FontWeight.w700,
                            color: AppColors.blackColor,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 8.0.w,top: 8.h,bottom: 8.h),
                            child: CustomText(
                              inputText: 'Take a look at our engineering and science labs, along with our student hub facilities across the historic setting in Chetham Maritime, Kent.',
                              textAlign: TextAlign.start,
                              fontSize: 10,
                              weight: FontWeight.w400,
                              color: AppColors.blackColor.withOpacity(0.70),
                            ),
                          ),

                          CustomButton(onPressed: (){},
                            width: 145.w,
                            height: 40.h,
                            title: 'Explore',
                            buttonColor: AppColors.tour,
                          ),
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 19.h,),
            CustomText(
              inputText: 'Audio tours',
              textAlign: TextAlign.start,
              fontSize: 15,
              weight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 19.h,),
            Container(
              // height: 143.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.tourColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child:Padding(
                padding:EdgeInsets.all(8.0.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/image 31.png',height: 119.h,width: 132.w,fit: BoxFit.scaleDown,),
                    SizedBox(width: 6.w,),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              inputText: 'Audio tours',
                              textAlign: TextAlign.start,
                              fontSize: 12,
                              weight: FontWeight.w700,
                              color: AppColors.blackColor,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 8.0.w,top: 8.h,bottom: 8.h),
                              child: CustomText(
                                inputText: 'Take an audio tour of our of Greenwich campus. We’ll introduce you to the university  campus and the historic town centre',
                                textAlign: TextAlign.start,
                                fontSize: 10,
                                weight: FontWeight.w400,
                                color: AppColors.blackColor.withOpacity(0.70),
                              ),
                            ),

                            CustomButton(onPressed: (){},
                              width: 145.w,
                              height: 40.h,
                              title: 'Explore',
                              buttonColor: AppColors.tour,
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }
}
