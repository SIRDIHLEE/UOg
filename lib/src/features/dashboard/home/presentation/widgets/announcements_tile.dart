import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';
import '../../../../../constant/route.dart';

class AnnouncementsTile extends StatelessWidget {
  const AnnouncementsTile({
    super.key,
  });

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
            itemCount:2,
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
                      image: const DecorationImage(image: AssetImage('assets/images/Rectangle 30.png'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(6.w, 0.h, 6.w, 9.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
