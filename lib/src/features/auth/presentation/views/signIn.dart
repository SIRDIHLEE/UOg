import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/features/auth/presentation/widgets/students.dart';
import 'package:uog/src/features/auth/presentation/widgets/staff.dart';

import '../../../../common/custom_text.dart';
import '../../../../constant/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  List<String> secondTabBar = <String>[
    'Student',
    'Staff',
  ];

  int current = 0;

  final List<Widget> tabs =[
   const Students(),
   const Staff()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Frame 958.png'),
                fit: BoxFit.cover
            )
        ),
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(17.w,0,17.w,0),
          child: Column(
            children: [
              SizedBox(height: 47.h,),
              Image.asset('assets/images/logo.png'),
              SizedBox(height: 152.h,),
              Container(
                width: double.maxFinite,
                height: 39.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.25),
                      offset: const Offset(
                        0.0,
                        1.0,
                      ),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                    color: AppColors.ash,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:  EdgeInsets.all(3.sp),
                  child: ListView.builder(
                      itemCount: secondTabBar.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: Container(
                            height: (35.h),
                            width: (157.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:   current==index?AppColors.primaryColor:Colors.transparent
                            ),
                            child: Center(
                              child:
                              CustomText(
                                inputText:  secondTabBar[index],
                                textAlign: TextAlign.center,
                                fontSize: 14,
                                weight: FontWeight.w500,
                                color:  current==index? AppColors.textColor:
                                AppColors.blackColor.withOpacity(0.50),
                                fontFamily: '',
                              ),

                            ),
                          ),
                        );
                      }),
                ),
              ),
              tabs[current],
            ],
          ),
        ),
      ),
      ),
    );
  }
}
