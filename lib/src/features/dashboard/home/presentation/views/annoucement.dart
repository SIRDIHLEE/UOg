import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.textColor,
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        title: CustomText(
          inputText: 'Announcement',
          textAlign: TextAlign.start,
          fontSize: 20,
          weight: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        padding:  EdgeInsets.fromLTRB(10.w, 22.h, 10.w, 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnnouncementContent(image: 'assets/images/Rectangle 30.png', title: 'Event for prospective student:', subtitle: "From taster days to subject open evenings, find out more about what you'll study, where you'll study it and perhaps even meet who'll you'll be studying with.",),
            SizedBox(height: 20.h,),
            const AnnouncementContent(image: 'assets/images/image 5.png', title: 'Teacher & Advisers:', subtitle: "Whether you are a teacher or parent, we offer a range of events designed to assist you in helping others make life choice",),
            SizedBox(height: 20.h,),
            const AnnouncementContent(image: 'assets/images/image_announce.png', title: 'Public event & lectures:', subtitle: "Learn something new or join the discussion at one of our many public lectures, seminars and events. Our public events cover everything from business and education to foreign policy and current affairs.",),
          ],
        ),
      ),

    );
  }
}

class AnnouncementContent extends StatelessWidget {
  const AnnouncementContent({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height:170.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
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
          child: Padding(
            padding:  EdgeInsets.only(left: 7.0.w,right: 7.w,top: 17.h,bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.asset(image,height: 113.62.h,width: 115.18.w,fit: BoxFit.cover,)),
                SizedBox(width: 11.5.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        inputText: title,
                        textAlign: TextAlign.start,
                        fontSize: 15,
                        weight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(height: 5.h,),
                      CustomText(
                        inputText: subtitle,
                        textAlign: TextAlign.start,
                        fontSize: 12,
                        weight: FontWeight.w500,
                        color: AppColors.blackColor.withOpacity(0.50),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
