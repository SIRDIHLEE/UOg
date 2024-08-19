import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color? titleColor;
  final TextStyle? titleStyle;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Function() onPressed;
  final bool? iconVisibility;
  final double? borderRadius;
  final Widget? child;
  final ButtonStyle? style;
  final bool? active;

  const CustomButton({
    required this.onPressed,
    this.title,
    this.titleColor,
    this.buttonColor,
    this.height,
    this.width,
    this.borderColor,
    this.iconVisibility,
    this.titleStyle,
    this.borderRadius,
    this.style,
    this.icon,
    this.child,
    this.active,
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      width: width ?? double.maxFinite,
      height: height ?? 54.h,
      child: ElevatedButton(
        style: style ??
            ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.zero),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
                      side: const BorderSide(color: AppColors.primaryColor))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor),
            ),
        onPressed: onPressed,
        child: child ??
            CustomText(
              inputText: title!,
              textAlign: TextAlign.center,
              fontSize: 14,
              weight: FontWeight.w500,
              color: titleColor ?? AppColors.scaffoldBackground,
              fontFamily: '',
            ),
      ),
    );
  }
}

class CustomizableButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color? titleColor;
  final TextStyle? titleStyle;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Function() onPressed;
  final bool? iconVisibility;
  final double? borderRadius;
  final Widget? child;
  final ButtonStyle? style;
  final bool? noWidth;

  const CustomizableButton({
    required this.onPressed,
    this.title,
    this.titleColor,
    this.buttonColor,
    this.height,
    this.width,
    this.borderColor,
    this.iconVisibility,
    this.titleStyle,
    this.borderRadius,
    this.style,
    this.icon,
    this.noWidth,
    this.child,
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      width: noWidth == true ? null : width ?? double.maxFinite,
      height: height ?? 46.h,
      child: ElevatedButton(
        style: style ??
            ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.zero),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
                      side: BorderSide(
                          color: borderColor ??
                              AppColors.blackColor.withOpacity(0.50)))),
              backgroundColor: MaterialStateProperty.all<Color>(
                  buttonColor ?? AppColors.ash),
            ),
        onPressed: onPressed,
        child: child ??
            CustomText(
              inputText: title!,
              textAlign: TextAlign.center,
              fontSize: 14,
              weight: FontWeight.w500,
              color: titleColor ?? AppColors.blackColor,
            ),
      ),
    );
  }
}
