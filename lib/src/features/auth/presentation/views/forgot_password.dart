import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/features/auth/presentation/views/signIn.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/custom_text.dart';
import '../../../../common/custom_textfield.dart';
import '../../../../constant/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isObscured = true;
  var _isSending = false;


  Future<void> _changePassword() async {
    if (!_key.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSending = true;
    });

    try {
      String email = _email.text.trim();
      String currentPassword = _currentPasswordController.text.trim();
      String newPassword = _newPasswordController.text.trim();
      String confirmPassword = _confirmPasswordController.text.trim();

      if (newPassword != confirmPassword) {
        throw FirebaseAuthException(
          code: 'password-mismatch',
          message: "New password and confirmation do not match",
        );
      }

      // Authenticate the user with the current email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: currentPassword,
      );
      User user = userCredential.user!;

      // Update the password
      await user.updatePassword(newPassword);

      // Handle successful password update
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success"),
            content: const Text("Password changed successfully."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/signin');
                },
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      if (e.code == 'user-not-found') {
        errorMessage = "Email address does not exist.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect old password.";
      } else if (e.code == 'weak-password') {
        errorMessage = "The new password is too weak.";
      } else if (e.code == 'password-mismatch') {
        errorMessage = "New password and confirmation do not match.";
      } else {
        errorMessage = "Error updating password: ${e.message}";
      }

      // Show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Frame 958.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(17.w, 0, 17.w, 0),
            child: Column(
              children: [
                SizedBox(height: 47.h),
                Image.asset('assets/images/logo.png'),
                SizedBox(height: 152.h),
                CustomText(
                  inputText: "Change Password",
                  textAlign: TextAlign.center,
                  fontSize: 16.sp,
                  weight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
                Form(
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
                        inputController: _currentPasswordController,
                        inputHintText: 'Enter your current password',
                        header: 'Current Password',
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                      SizedBox(height: 8.h),
                      CustomPasswordWithoutValInputField(
                        isObscured: _isObscured,
                        inputController: _newPasswordController,
                        inputHintText: 'Enter your new password',
                        header: 'New Password',
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                      SizedBox(height: 8.h),
                      CustomPasswordWithoutValInputField(
                        isObscured: _isObscured,
                        inputController: _confirmPasswordController,
                        inputHintText: 'Re-enter your new password',
                        header: 'Confirm New Password',
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomizableButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            title: 'Cancel',
                            width: 159.w,
                          ),
                          CustomizableButton(
                            onPressed: _isSending ? (){} : _changePassword,
                            title: _isSending ? null : 'Change password',
                            titleColor: Colors.white,
                            width: 159.w,
                            buttonColor: AppColors.primaryColor,
                            child: _isSending
                                ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                                : null,
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
