import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/custom_button.dart';
import '../../../../common/custom_text.dart';
import '../../../../common/custom_textfield.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/route.dart';
import 'or_text.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscured = true;
  var _isSending = false;
  var _error;

  void _signIn() async {
    setState(() {
      _isSending = true;
    });

    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _passwordController.text,
      );

      final User? user = userCredential.user;

      if (user != null) {
        if (_email.text == 'kolawole2024@outlook.com' || _email.text == 'sammy2024@outlook.com') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Access denied for this email.')),
          );
        } else {
          Navigator.pushReplacementNamed(context, Routes.staffDashboard);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not found')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 19.h),
          CustomEmailInputField(
            inputController: _email,
            inputHintText: 'Enter your university email address',
            keyboardType: TextInputType.emailAddress,
            header: 'Email Address',
          ),
          SizedBox(height: 8.h),
          CustomPasswordWithoutValInputField(
            isObscured: _isObscured,
            inputController: _passwordController,
            inputHintText: 'Enter your password',
            header: 'Password',
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          ),
          CustomText(
            inputText: "Forgot password?",
            textAlign: TextAlign.center,
            fontSize: 14,
            weight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
          SizedBox(height: 8.h),
          CustomButton(
            title: 'Sign In',
            borderRadius: 10,
            onPressed: _signIn,
          ),
          SizedBox(height: 12.h),
          const OrText(),
          SizedBox(height: 16.h),
          CustomizableButton(
            onPressed: () {},
            title: 'Continue as Guest',
          ),
          SizedBox(height: 12.h),
          CustomizableButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.staffDashboard);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  inputText: "Login with Outlook",
                  textAlign: TextAlign.center,
                  fontSize: 14,
                  weight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
                SizedBox(width: 23.w),
                SvgPicture.asset('assets/images/svg_images/outlook.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
