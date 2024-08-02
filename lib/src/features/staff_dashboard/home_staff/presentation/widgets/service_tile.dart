import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount:3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(right: 10.w),
            child: Container(
              height: 106.h,
              width: 130.w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/images/Rectangle 3439.png'),
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
                      inputText: "Bus services",
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
    'assets/images/gold.png',
    'assets/images/image 11(1).png',
    'assets/images/image 12(1).png'
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 10.0.sp),
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
          padding:  EdgeInsets.all(5.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/Rectangle 33.png',),
              SizedBox(height: 10.h,),
              CustomText(
                inputText: 'No. 92 Cafe',
                textAlign: TextAlign.start,
                fontSize: 14,
                weight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
              CustomText(
                inputText: 'Breakfast & Brunch, Coffee & Tea',
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
  }
}

