import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uog/src/constant/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.scaffoldBackground,
        title:  Padding(
          padding: EdgeInsets.all(6.sp),
          child: Text(
           "Notification",  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
          
        ),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today's Update", style: GoogleFonts.poppins(color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.bold),),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/noti.png", height: 30,),
                SizedBox(width: 10.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Weather Alert:",  style: GoogleFonts.poppins(color: AppColors.redColor, fontSize: 18)),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Text("Stay prepared: Today's weather forecast includes partly cloudy skies with a high of 24°C and a low of 16°C. Remember to carry a light jacket.", style: GoogleFonts.poppins(fontSize: 15),),
                      SizedBox(height: 10.h),
                      Text("Few min ago", style: GoogleFonts.poppins(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),

              ],
            ),
             Divider()
          ],
        ),
      ),
    );
  }
}