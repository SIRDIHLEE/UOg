import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/common/custom_button.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/log_out.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/password_changed.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/settings_tiles.dart';

import '../../../../common/alert_dialog.dart';
import '../../../../common/custom_text.dart';
import '../../../../common/custom_textfield.dart';

class SettingsStaff extends StatefulWidget {
  const SettingsStaff({super.key});

  @override
  State<SettingsStaff> createState() => _SettingsStaffState();
}

class _SettingsStaffState extends State<SettingsStaff> {
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  bool switchValue1 = false;
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding:  EdgeInsets.fromLTRB(11.w,51.h,11.w,11.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.arrow_back_outlined),
                SizedBox(width: 91.w,),
                CustomText(inputText:'Settings' ,
                    fontSize: 24,
                    weight: FontWeight.w700,
                    color: Colors.black),
              ],
            ),
            SizedBox(height: 18.h,),
            const SettingsCard(),

            SizedBox(height: 27.h,),
            CustomText(inputText:'Profile Settings' ,
                fontSize: 18,
                weight: FontWeight.w600,
                color: Colors.black),
            SizedBox(height: 16.h,),
            CustomInputField(
              inputController: _fullName,
              inputHintText: 'Full Name',
              keyboardType: TextInputType.emailAddress,
              header: 'Full Name',
            ),
            SizedBox(height: 16.h,),
            CustomInputField(
              inputController: _email,
              inputHintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              header: 'Email',
            ),
            SizedBox(height: 16.h,),
            CustomInputField(
              inputController: _phone,
              inputHintText: 'Phone Number',
              keyboardType: TextInputType.emailAddress,
              header: 'Phone Number',
            ),
            SizedBox(height: 27.h,),
            CustomText(inputText:'Notifications' ,
                fontSize: 18,
                weight: FontWeight.w600,
                color: Colors.black),
            SizedBox(height: 18.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(inputText:'Push notifications' ,
                    fontSize: 14,
                    weight: FontWeight.w400,
                    color: Colors.black),
                Transform.scale(
                  scale: 0.75,
                  child: CupertinoSwitch(
                    value: switchValue1,
                    activeColor: AppColors.primaryColor,
                    onChanged: (bool value) {
                      setState(() {
                        switchValue1 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h,),
            CustomText(inputText:'Notifications preferences ' ,
                fontSize: 14,
                weight: FontWeight.w400,
                color: Colors.black),
            SizedBox(height: 18.h,),
            CustomText(inputText:'Security' ,
                fontSize: 18,
                weight: FontWeight.w600,
                color: Colors.black),
            SizedBox(height: 11.h,),
            CustomPasswordInputField(
              inputController: _phone,
              headerColor: AppColors.openday,
              inputHintText: 'Password',
              header: 'Change Password',
              isObscured: _isObscured,
              onPressed: () {setState(() {
                _isObscured = !_isObscured;
              });},
            ),
            SizedBox(height: 20.h,),
            const SettingsButtons()
          ],
        ),
      ),
    );
  }
}
