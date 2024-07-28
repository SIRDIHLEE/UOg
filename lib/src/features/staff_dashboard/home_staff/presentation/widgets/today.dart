import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/features/staff_dashboard/home_staff/presentation/widgets/service_tile.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class Today extends StatefulWidget {
  const Today({super.key});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 119.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF000000),
                    Color(0xFF1D224E),
                  ],
                  stops: [0.0, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                inputText: '16',
                                fontSize: 72,
                                weight: FontWeight.w600,
                                color: Colors.white),
                            CustomText(
                                inputText: '\u2103',
                                fontSize: 48,
                                weight: FontWeight.w500,
                                color: Colors.white),
                          ],
                        ),
                        SizedBox(
                          width: 26.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  inputText: 'Monday, 03 July',
                                  fontSize: 16,
                                  weight: FontWeight.w700,
                                  color: Colors.white),
                              CustomText(
                                  inputText:
                                      '⛅ Light rain|Remember to carry a light jacket',
                                  fontSize: 12,
                                  weight: FontWeight.w500,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CustomText(
                        inputText: 'United kingdom|london',
                        fontSize: 12,
                        weight: FontWeight.w500,
                        color: Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 133.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/images/image 25.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(12.w, 0.h, 12.w, 6.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      inputText: "Event For Prospective Student",
                      textAlign: TextAlign.start,
                      fontSize: 14,
                      weight: FontWeight.w400,
                      color: AppColors.scaffoldBackground,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              // height: 290.h,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.25)),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(13.0.w,15.h,13.w,15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      inputText: 'Campus Service',
                      textAlign: TextAlign.start,
                      fontSize: 15,
                      weight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(height: 16.h,),
                    const ServiceTile(),
                    SizedBox(height: 12.h,),
                    CustomText(
                      inputText: 'Creative Futures',
                      textAlign: TextAlign.start,
                      fontSize: 15,
                      weight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(height: 16.h,),
                    const ServiceTile(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            CustomText(
              inputText: 'Nearest Eateries',
              textAlign: TextAlign.start,
              fontSize: 15,
              weight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const EateriesTile();
                },
              ),
            ),

            SizedBox(height: 20.h,),

          ],
        ),
      ],
    );
  }
}


