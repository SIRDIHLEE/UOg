import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';
import '../../../../../constant/route.dart';


class AnnouncementsTile extends StatelessWidget {
   AnnouncementsTile({
    super.key,
  });

  final List<String> imageList = [
    'assets/images/Rectangle 30.png',
    'assets/images/image 5.png',
    'assets/images/image_announce.png',
  ];

  final List<String> titleList = [
    'Event For Prospective Student',
    'Teacher and Advisers',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              inputText: "Announcements",
              textAlign: TextAlign.center,
              fontSize: 15,
              weight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, Routes.announcementScreen);
              },
              child: CustomText(
                inputText: "View all",
                textAlign: TextAlign.center,
                fontSize: 14,
                weight: FontWeight.w400,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h,),
        SizedBox(
          height: 140.w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount:imageList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(right: 10.w),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.eventsScreen);
                  },
                  child: Container(
                    height: 140.h,
                    width: 220.w,
                    decoration:BoxDecoration(
                      image:  DecorationImage(image: AssetImage(imageList[index]), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(6.w, 0.h, 6.w, 9.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            inputText:titleList[index],
                            textAlign: TextAlign.start,
                            fontSize: 14,
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
        ),
      ],
    );
  }
}
