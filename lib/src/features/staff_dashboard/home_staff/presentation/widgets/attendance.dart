import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/features/staff_dashboard/home_staff/presentation/widgets/students.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';
import '../../../../../constant/route.dart';
import 'attendance_tile.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AttendanceTile(),
        SizedBox(height: 16.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              inputText: '1st August 2024',
              textAlign: TextAlign.start,
              fontSize: 12,
              weight: FontWeight.w600,
              color: AppColors.blackColor.withOpacity(0.50),
            ),
            Icon(Icons.keyboard_arrow_down_outlined,color:  AppColors.blackColor.withOpacity(0.50),)
          ],
        ),
        SizedBox(height: 16.h,),
        Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.attendanceBColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 18.0.w,right: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  inputText: 'Name',
                  textAlign: TextAlign.start,
                  fontSize: 12,
                  weight: FontWeight.w600,
                  color: AppColors.scaffoldBackground,
                ),
                CustomText(
                  inputText: 'Student Id',
                  textAlign: TextAlign.start,
                  fontSize: 12,
                  weight: FontWeight.w600,
                  color: AppColors.scaffoldBackground,
                ),
                CustomText(
                  inputText: 'Status',
                  textAlign: TextAlign.start,
                  fontSize: 12,
                  weight: FontWeight.w600,
                  color: AppColors.scaffoldBackground,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return  GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,Routes.studentsScreen);
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(backgroundColor: Colors.grey,),
                            SizedBox(width: 9.w,),
                            CustomText(
                              inputText: 'Carla Bator',
                              textAlign: TextAlign.start,
                              fontSize: 12,
                              weight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ],
                        ),
                        CustomText(
                          inputText: '0123456789',
                          textAlign: TextAlign.start,
                          fontSize: 12,
                          weight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                        Container(
                          height: 21.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            border:Border.all(
                              color: AppColors.absentTColor,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.absentTColor,
                                radius: 5.r,
                              ),
                              SizedBox(width: 2.w,),
                              CustomText(
                                inputText: 'Present',
                                textAlign: TextAlign.start,
                                fontSize: 10,
                                weight: FontWeight.w500,
                                color: AppColors.absentTColor,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.black.withOpacity(0.20)),
                  ],
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}

