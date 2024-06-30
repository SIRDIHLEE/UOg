import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';

import '../../../../constant/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () =>
        //Navigator.pushReplacementNamed(context, Routes.nav)
        Navigator.pushReplacementNamed(
            context, Routes.onboarding)
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 343.h,),
            Image.asset('assets/images/logo.png',alignment: Alignment.center,),
            SizedBox(height: 185.h,),
            Image.asset('assets/images/logo2.png'),

          ],
        ),
      ),

    );
  }
}
