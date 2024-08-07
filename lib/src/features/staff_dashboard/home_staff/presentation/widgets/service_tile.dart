import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/route.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class ServiceTile extends StatefulWidget {
  const ServiceTile({
    super.key,
  });

  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  final List<String> imageList = [
    'assets/images/dash1.png',
    'assets/images/dash2.png',
    'assets/images/dash4.png'
  ];

  List<String> secondTabBar = <String>[
    'Bus service',
    'Campus Tour',
    'Accommodation',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: GestureDetector(
              onTap: () {
                if (secondTabBar[index] == "Bus service") {
                  Navigator.pushNamed(context, Routes.busService);
                }
                if (secondTabBar[index] == "Campus Tour") {
                  // Navigator.pushNamed(context, Routes.tours);
                }
              },
              child: Container(
                height: 106.h,
                width: 130.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageList[index]), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 0.h, 12.w, 6.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        inputText: secondTabBar[index],
                        textAlign: TextAlign.start,
                        fontSize: 12,
                        weight: FontWeight.w500,
                        color: AppColors.scaffoldBackground,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CreativeTile extends StatefulWidget {
  const CreativeTile({
    super.key,
  });

  @override
  State<CreativeTile> createState() => _CreativeTileState();
}

class _CreativeTileState extends State<CreativeTile> {
  final List<String> imageList = [
    'assets/images/1_.png',
    'assets/images/2.png',
    'assets/images/3.png'
  ];

  List<String> secondTabBar = <String>[
    'About Us',
    'Our Research',
    'Our Impact',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Container(
              height: 106.h,
              width: 130.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageList[index]), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(12.w, 0.h, 12.w, 6.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      inputText: secondTabBar[index],
                      textAlign: TextAlign.start,
                      fontSize: 12,
                      weight: FontWeight.w500,
                      color: AppColors.scaffoldBackground,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class EateriesTile extends StatefulWidget {
  const EateriesTile({
    super.key,
  });

  @override
  State<EateriesTile> createState() => _EateriesTileState();
}

class _EateriesTileState extends State<EateriesTile> {
  final List<String> imageList = [
    'assets/images/Rectangle 33.png',
    'assets/images/Rectangle 33.png',
    'assets/images/Rectangle 33.png',
  ];
  final List<String> addressList = [
    'No. 92 Cafe\nBreakfast & Brunch, Coffee & Tea',
    'Trafalgar Tavern\nBar, British Resturant, Pub ',
    'The Cutty Sark\nBritish Resturant,Bar,Pub ',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imageList.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 10.0.sp),
          child: Container(
            // height: 200.h,
            width: 270.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.80),
                  spreadRadius: -5,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imageList[index],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    inputText: addressList[index],
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    weight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
