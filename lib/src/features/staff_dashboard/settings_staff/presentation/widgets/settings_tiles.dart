import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/common/custom_button.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/log_out.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/password_changed.dart';

import '../../../../../common/alert_dialog.dart';
import '../../../../../common/custom_text.dart';


class SettingsButtons extends StatelessWidget {
  const SettingsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            CustomAlertDialog.showAlertDialog(
              context: context,
              height: 155.h,
              isDissmisable: false,
              child:  const LogOut(),
            );

          },
          child: Container(
            height: 47.h,
            width: 155.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.textField),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: CustomText(inputText:'Log out' ,
                  fontSize: 16,
                  weight: FontWeight.w400,
                  color: AppColors.textField),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            CustomAlertDialog.showAlertDialog(
              context: context,
              height: 136.h,
              isDissmisable: true,
              child:  const PasswordChanged(),
            );

          },
          child: Container(
            height: 47.h,
            width: 155.w,
            decoration: BoxDecoration(
              color: AppColors.textField,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: CustomText(inputText:'Save Changes' ,
                  fontSize: 16,
                  weight: FontWeight.w400,
                  color: AppColors.scaffoldBackground),
            ),
          ),
        ),
      ],
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.settingsBColor
      ),
      child: Row(
        children: [
          SizedBox(width: 18.w,),
          Image.asset('assets/images/Ellipse 255.png',height: 80.h,width: 80.w,fit: BoxFit.scaleDown,),
          SizedBox(width: 20.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              CustomText(inputText:'Rowen Wright' ,
                  fontSize: 20,
                  weight: FontWeight.w600,
                  color: Colors.black),
              CustomText(inputText:'Staff ID: 12345' ,
                  fontSize: 16,
                  weight: FontWeight.w400,
                  color: Colors.black),
            ],
          )
        ],
      ),
    );
  }
}
