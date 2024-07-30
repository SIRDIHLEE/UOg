import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class PasswordChanged extends StatefulWidget {
  const PasswordChanged({super.key});

  @override
  State<PasswordChanged> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<PasswordChanged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              inputText: 'Password changed!',
              textAlign: TextAlign.center,
              fontSize: 12,
              weight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
            SizedBox(height:15.h,),
            const Icon(Icons.check_circle,size: 50,color: AppColors.iconColor,)
          ],
        ),
      ),
    );
  }
}
