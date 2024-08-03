import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/common/custom_button.dart'; // Ensure this is implemented
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/log_out.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/password_changed.dart';

import '../../../../../common/alert_dialog.dart';
import '../../../../../common/custom_text.dart';

class SettingsButtons extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onLogout;

  const SettingsButtons({
    super.key,
    required this.onSave,
    required this.onLogout,
  });

  void _showLogoutDialog(BuildContext context) {
    CustomAlertDialog.showAlertDialog(
      context: context,
      height: 155.h,
      isDissmisable: false,
      child: LogOut(
        onConfirmLogout: () {
          Navigator.of(context).pop(); // Close the dialog
          onLogout(); // Call the logout function
        },
        onCancel: () {
          Navigator.of(context).pop(); // Close the dialog
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _showLogoutDialog(context), // Show dialog
          child: Container(
            height: 47.h,
            width: 155.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.redColor,),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: CustomText(
                inputText: 'Cancel',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.redColor,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onSave, // Use the save callback
          child: Container(
            height: 47.h,
            width: 155.w,
            decoration: BoxDecoration(
              color: AppColors.textField,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: CustomText(
                inputText: 'Save Changes',
                fontSize: 16,
                weight: FontWeight.w400,
                color: AppColors.scaffoldBackground,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
