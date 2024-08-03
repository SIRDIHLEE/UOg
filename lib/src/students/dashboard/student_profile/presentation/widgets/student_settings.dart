import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/log_out.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/password_changed.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/settings_tiles.dart';
import '../../../../../common/alert_dialog.dart';
import '../../../../../common/custom_text.dart';
import '../../../../../common/custom_textfield.dart';


class StudentSettings extends StatefulWidget {
  const StudentSettings({super.key});

  @override
  State<StudentSettings> createState() => _StudentSettingsState();
}

class _StudentSettingsState extends State<StudentSettings> {
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool switchValue1 = false;
  bool _isObscured = true;
  String? _profilePicUrl;// Default school ID

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userCollection = FirebaseFirestore.instance.collection('users');
      final docRef = userCollection.doc(user.uid);

      try {
        DocumentSnapshot doc = await docRef.get();

        if (doc.exists) {
          setState(() {
            _fullName.text = doc['name'] ?? 'New User';
            _phone.text = doc['phone_num'] ?? '';
            _email.text = doc['email'] ?? '';
            _profilePicUrl = doc['profilePicture'] ?? 'https://path-to-your-default-image.jpg';
          });
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading user data: $e')),
        );
      }
    }
  }

  Future<void> _saveChanges() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userCollection = FirebaseFirestore.instance.collection('users');
      final docRef = userCollection.doc(user.uid);

      try {
        await docRef.set({
          'name': _fullName.text,
          'phone_num': _phone.text,
          'email': _email.text,
          'profilePicture': _profilePicUrl,
        }, SetOptions(merge: true));

        // Update the local state to reflect the changes

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating profile: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not signed in')),
      );
    }
  }


  // void _onLogout() {
  //   FirebaseAuth.instance.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Settings", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, size: 32.w,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(11.w, 51.h, 11.w, 11.h),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    inputText: 'Security',
                    fontSize: 18,
                    weight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 11.h),
                  CustomPasswordInputField(
                    inputController: _password,
                    headerColor: AppColors.openday,
                    inputHintText: 'Enter your current password',
                    header: 'Current Password',
                    isObscured: _isObscured,
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                  SizedBox(height: 5.h),
                  CustomPasswordInputField(
                    inputController: _password,
                    headerColor: AppColors.openday,
                    inputHintText: 'Enter your new password',
                    header: 'New Password',
                    isObscured: _isObscured,
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 200.h),
                child: StudentSettingsButtons(onSave: (){}, onLogout: (){}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class StudentSettingsButtons extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onLogout;

  const StudentSettingsButtons({
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
          // onTap: () => _showLogoutDialog(context), // Show dialog
        onTap: () {},
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

