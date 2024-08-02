import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/event/widgets/eventItem.dart';

import '../../common/custom_text.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title: CustomText(
        inputText: "Events",
        textAlign: TextAlign.start,
        fontSize: 20,
        weight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          EventItem(heading: "Open Day", date: "25th October 2024", subtext: "Join us for our open day to explore the campus and meet the faculty.", image: Image.asset("assets/images/cal.png",  height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,), time: '10:00 AM - 3:00 PM', image2: Image.asset("assets/images/clock.png", height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,),),
          const SizedBox(height: 10,),
          EventItem(heading: "Virtual Tours", date: "25th October 2023", subtext: "Experience our campus from the comfort of your home with our virtual tour", image:  Image.asset("assets/images/cal.png",  height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,), time: "10:00 AM - 3:00 PM", image2: Image.asset("assets/images/clock.png",  height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,),),
          const SizedBox(height: 10,),
          EventItem(heading: "Meet the students", date: "25th October 2023", subtext: "Chat with our students and get a firsthand account of student life.", image: Image.asset("assets/images/cal.png",  height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,), time: "10:00 AM - 3:00 PM", image2: Image.asset("assets/images/clock.png", height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,),),
          const SizedBox(height: 10,),
          EventItem(heading: "Course Information Session", date: "25th October 2023", subtext: "Learn more about our courses and the application process", image: Image.asset("assets/images/cal.png", height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,), time: "10:00 AM - 3:00 PM", image2: Image.asset("assets/images/clock.png",  height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,),),
          const SizedBox(height: 10,),
          EventItem(heading: "Freshers' Week", date: "25th October 2023", subtext: "Join us for a week of fun activities and meet new friends!", image:  Image.asset("assets/images/cal.png", height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,), time: "10:00 AM - 3:00 PM", image2:  Image.asset("assets/images/clock.png", height: 14.h,width: 12.25.w,fit: BoxFit.scaleDown,),)

        ],
      ),
    );
  }
}
