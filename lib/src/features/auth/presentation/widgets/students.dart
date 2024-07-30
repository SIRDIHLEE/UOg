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

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  final _email = TextEditingController();
  final _passwordController = TextEditingController();
  var _isSending = false;
  bool _isObscured = true;
  var _error;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _auth() async {
    setState(() {
      _isSending = true;
    });

    try {
      final provider = OAuthProvider("microsoft.com");
      provider.setCustomParameters({"tenant": "8faf8922-85dc-4d3c-a024-289010076a45"});
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithProvider(provider);
      final User? user = userCredential.user;

      if (user != null) {
        if (_email.text == 'elvis2025@outlook.com') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Access denied for this tab')),
          );
        } else {
          Navigator.pushReplacementNamed(context, Routes.dashboard);
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
            onPressed: _auth,
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
            onPressed: _auth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isSending
                    ? Row(children: [
                  const SizedBox(height: 5, child: CircularProgressIndicator(color: Colors.black)),
                  CustomText(
                    inputText: "Loading",
                    textAlign: TextAlign.center,
                    fontSize: 14,
                    weight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ])
                    : CustomText(
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
