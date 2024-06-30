import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/custom_text.dart';
import '../../../../constant/colors.dart';

class OrText extends StatelessWidget {
  const OrText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 150.w,
          child: DottedLine(
            dashLength: 4.h,
            dashGapLength: 1.h,
            lineThickness: 2,
            dashColor: Colors.black,
            dashGapColor: Colors.white,
          ),
        ),
        CustomText(
          inputText: "or",
          textAlign: TextAlign.center,
          fontSize: 14,
          weight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
        SizedBox(
          width: 150.w,
          child: DottedLine(
            dashLength: 4.h,
            dashGapLength: 1.h,
            lineThickness: 2,
            dashColor: Colors.black,
            dashGapColor: Colors.white,
          ),
        ),
        SizedBox(height: 16.h,),

      ],
    );
  }
}
