import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.fromLTRB(11.w,51.h,11.w,11.h),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_outlined)),
                    SizedBox(width: 91.w,),
                    CustomText(inputText:'Students' ,
                        fontSize: 24,
                        weight: FontWeight.w700,
                        color: Colors.black),
                  ],
                ),
                SizedBox(height: 15.h,),
                CupertinoSearchTextField(
                  padding: EdgeInsets.all(10.sp),
                  itemColor: AppColors.greyColor,
                  decoration: BoxDecoration(
                    color: AppColors.search,
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:  EdgeInsets.fromLTRB(11.w,0.h,11.w,11.h),
                  child: Container(
                    height: 50.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 8.w,),
                        Image.asset('assets/images/Ellipse 255.png',height: 30.h,width: 30.w,fit: BoxFit.scaleDown,),
                        SizedBox(width: 11.w,),
                        CustomText(inputText:'Leo Bator' ,
                            fontSize: 14,
                            weight: FontWeight.w500,
                            color: Colors.black),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),


        ],
      ),
    );
  }
}
