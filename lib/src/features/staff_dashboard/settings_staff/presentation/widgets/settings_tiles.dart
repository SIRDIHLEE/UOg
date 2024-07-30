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
  final VoidCallback onLogout; // Add a callback for saving changes

  const SettingsButtons({
    super.key,
    required this.onSave,
    required this.onLogout,// Initialize the callback
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            CustomAlertDialog.showAlertDialog(
              context: context,
              height: 155.h,
              isDissmisable: false,
              child: const LogOut(),
            );
          },
          child: GestureDetector(
            child: Container(
              height: 47.h,
              width: 155.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textField),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CustomText(
                  inputText: 'Log out',
                  fontSize: 16,
                  weight: FontWeight.w400,
                  color: AppColors.textField,
                ),
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



// class SettingsCard extends StatelessWidget {
//   final String? profilePicUrl; // Optional profile picture URL
//
//   const SettingsCard({
//     super.key,
//     this.profilePicUrl, // Include profilePicUrl in the constructor
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 96.h,
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//         color: AppColors.settingsBColor, // Background color of the card
//       ),
//       child: Row(
//         children: [
//           SizedBox(width: 18.w),
//           // Display the profile picture if available, otherwise show a default image
//           profilePicUrl != null
//               ? Image.network(
//             profilePicUrl!,
//             height: 80.h,
//             width: 80.w,
//             fit: BoxFit.cover,
//           )
//               : Image.asset(
//             'assets/images/Ellipse 255.png', // Default profile picture
//             height: 80.h,
//             width: 80.w,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(width: 20.w),
//           // Display user information
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomText(
//                 inputText: 'Rowen Wright', // Placeholder name; replace with actual user data if available
//                 fontSize: 20,
//                 weight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//               CustomText(
//                 inputText: 'Staff ID: 12345', // Placeholder ID; replace with actual user ID if available
//                 fontSize: 16,
//                 weight: FontWeight.w400,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

