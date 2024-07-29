import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Padding(
        padding:  EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 31.h,
        ),
        child: Column(
          children: [
            CustomText(
              inputText: 'Are you sure you want to Log out?',
              textAlign: TextAlign.center,
              fontSize: 15,
              weight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 31.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: CustomText(
                          inputText:'Cancel' ,
                          fontSize: 12,
                          weight: FontWeight.w400,
                          color: AppColors.scaffoldBackground),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textField),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: CustomText(inputText:'Sign out' ,
                          fontSize: 12,
                          weight: FontWeight.w500,
                          color: AppColors.textField),
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
