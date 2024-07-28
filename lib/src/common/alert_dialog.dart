import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';

class CustomAlertDialog {
  static void showAlertDialog({
    required BuildContext context,
    required Widget child,
    bool isDissmisable = true,
    double? height,
  }) {
    showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: isDissmisable,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 245.w,
              height: height ?? 510.h,
              color: AppColors.scaffoldBackground,
              // padding: EdgeInsets.only(
              //   left: 40.w,right: 40.w,top: 8.h,bottom: 39.h,h
              // ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

