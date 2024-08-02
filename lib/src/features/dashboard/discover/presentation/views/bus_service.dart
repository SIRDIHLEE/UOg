import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class BusService extends StatefulWidget {
  const BusService({super.key});

  @override
  State<BusService> createState() => _BusServiceState();
}

class _BusServiceState extends State<BusService> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.textColor,
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        title: CustomText(
          inputText: 'Bus service',
          textAlign: TextAlign.start,
          fontSize: 20,
          weight: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/Frame 34598.png'),
             Padding(
              padding:  EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 0),
              child: Container(
                // height: 273.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            inputText: 'Stop Name',
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            weight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                          CustomText(
                            inputText: 'GRE-AH',
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            weight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black.withOpacity(0.50),),
                    const BusServiceContent(title: 'Greenwich Campus', subtitle: 'Queen Anne Court',),
                    SizedBox(height: 20.h,),
                    const BusServiceContent(title: 'Eltham Station', subtitle: '(Stop D)',),
                    SizedBox(height: 20.h,),
                    const BusServiceContent(title: 'Eltham High Street', subtitle: 'Marks & Spencer (Stop L)',),
                    SizedBox(height: 20.h,),
                    const BusServiceContent(title: 'Avery Hill', subtitle: 'Marks & Spencer (Stop L)',),
                    SizedBox(height: 20.h,),
                  ],
                ),
              ),
            ),
             Padding(
              padding:  EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 20.h),
              child: Container(
                // height: 273.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            inputText: 'Stop Name',
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            weight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                          CustomText(
                            inputText: 'GRE-AH',
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            weight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.black.withOpacity(0.50),),
                    const BusServiceContent(title: 'Avery Hill', subtitle: 'Southwood site',),
                    SizedBox(height: 20.h,),
                    const BusServiceContent(title: 'Falconwood Station', subtitle: '(Stop R)',),
                    SizedBox(height: 20.h,),
                    const BusServiceContent(title: 'Greenwich Campus', subtitle: 'Queen Anne Court',),
                    SizedBox(height: 20.h,),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusServiceContent extends StatelessWidget {
  const BusServiceContent({
    super.key, required this.title, required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 8.0.w,right: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                inputText:title,
                textAlign: TextAlign.start,
                fontSize: 16,
                weight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
              CustomText(
                inputText: subtitle,
                textAlign: TextAlign.start,
                fontSize: 12,
                weight: FontWeight.w600,
                color: AppColors.blackColor.withOpacity(0.50),
              ),
            ],
          ),
          CustomText(
            inputText: '08:15 09:35 10:30 11:30',
            textAlign: TextAlign.start,
            fontSize: 12,
            weight: FontWeight.w400,
            color: AppColors.blackColor.withOpacity(0.50),
          ),
        ],
      ),
    );
  }
}
