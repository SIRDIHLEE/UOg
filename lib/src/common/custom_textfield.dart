import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uog/src/common/custom_text.dart';
import 'package:uog/src/constant/colors.dart';


class CustomInputField extends StatefulWidget {
  CustomInputField(
      {super.key, required this.inputController,
        required this.inputHintText,
        required this.keyboardType,
        required this.header,
        this.onChanged,
        this.maxLength,
        this.enabled,
        this.suffix,
        this.onTap,
        bool? isObscured,
        Function()? onPressed});

  TextEditingController inputController;
  String inputHintText;
  String header;
  TextInputType keyboardType;
  int? maxLength;
  bool? enabled;
  void Function(String)? onChanged;
  void Function()? onTap;
  Widget? suffix;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool showHint = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.header == ''
            ? const SizedBox.shrink()
            :  CustomText(
          inputText: widget.header??'',
          fontSize: 16,
          weight: FontWeight.w400,
          color: AppColors.openday,),
        SizedBox(height: widget.header == '' ? 0 : 9.h),
        Center(
          child: TextFormField(
            autofocus: false,
            controller: widget.inputController,
            keyboardType: widget.keyboardType,
            cursorColor: AppColors.blackColor,
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            decoration: InputDecoration(
              counterText: '',
              filled: false,
              fillColor: AppColors.ash,
              contentPadding: EdgeInsets.all(10.sp),
              suffix: Padding(
                padding:
                EdgeInsets.only(right: (18.w)),
                child: widget.suffix,
              ),
              border:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.50)),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),

              hintText: widget.inputHintText,
              hintStyle: GoogleFonts.montserrat(
                  fontSize: (14.sp),
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor.withOpacity(0.50)),
            ),
            validator: (value) => value!.isEmpty ? 'Enter ${widget.inputHintText}' : null,
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  showHint = false;
                } else {
                  showHint = true;
                }
              });
            },
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}

/// Password InputField with Validation
class CustomPasswordInputField extends StatefulWidget {
  CustomPasswordInputField(
      {super.key, required this.inputController,
        required this.inputHintText,
        required this.isObscured,
        required this.onPressed,
        this.onFieldSubmitted,
        this.header,
        this.headerColor,
        this.onChanged,
        this.onTap});

  TextEditingController inputController;
  String inputHintText;
  String? header;
   Color? headerColor;
  bool isObscured;
  Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  void Function()? onTap;
  VoidCallback onPressed;

  @override
  State<CustomPasswordInputField> createState() =>
      _CustomPasswordInputFieldState();
}

class _CustomPasswordInputFieldState extends State<CustomPasswordInputField> {
  bool showHint = false;

  RegExp passwordValid = RegExp(r'(?=.*[a-z])');
  RegExp passwordValid2 = RegExp(r'(?=.*[A-Z])');
  RegExp passwordValid3 = RegExp(r'(?=.*[0-9])');
  RegExp passwordValid4 = RegExp(r'(?=.*[^A-Za-z0-9])');
  RegExp passwordValid5 = RegExp(r'(?=.{8,})');

  bool validatePassword(String pass) {
    String password = pass.trim();
    if (passwordValid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword2(String pass) {
    String password = pass.trim();
    if (passwordValid2.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword3(String pass) {
    String password = pass.trim();
    if (passwordValid3.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword4(String pass) {
    String password = pass.trim();
    if (passwordValid4.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword5(String pass) {
    String password = pass.trim();
    if (passwordValid5.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.header == ''
            ? const SizedBox.shrink()
            :  CustomText(
          inputText: widget.header??'',
          fontSize: 14,
          weight: FontWeight.w500,
          color: widget.headerColor??AppColors.blackColor,),
        SizedBox(height: widget.header == '' ? 0 : 9.h),
        TextFormField(
          controller: widget.inputController,
          obscureText: widget.isObscured ? true : false,
          cursorColor: AppColors.blackColor,
          keyboardType: TextInputType.text,
          autocorrect: false,
          decoration: InputDecoration(
            filled: false,
            fillColor: AppColors.ash,
            suffix: GestureDetector(
              onTap: widget.onPressed,
              child: Icon(
                widget.isObscured ?
    Iconsax.eye
                    : Iconsax.eye_slash,
                color: AppColors.suffixIconColor,
                size: (18.sp),
              ),
            ),
             contentPadding: EdgeInsets.all(10.sp),
            border:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.50)),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),

            hintText: widget.inputHintText,
            hintStyle: GoogleFonts.montserrat(
                fontSize: (14.sp),
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor.withOpacity(0.50)),
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            } else {
              bool result = validatePassword(value);
              if (result == false) {
                return 'Password should contain small letter';
              } else {
                bool result2 = validatePassword2(value);
                if (result2 == false) {
                  return 'Password should contain capital letter';
                } else {
                  bool result3 = validatePassword3(value);
                  if (result3 == false) {
                    return 'Password should contain number';
                  } else {
                    bool result4 = validatePassword4(value);
                    if (result4 == false) {
                      return 'Password should contain special character';
                    } else if (value.length < 8) {
                      return 'Password should be atleast 8 characters';
                    } else {}
                  }
                }
              }
            }
          },
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                showHint = false;
              } else {
                showHint = true;
              }
            });
          },
          onTap: widget.onTap,
        ),

      ],
    );
  }
}

/// Password InputField without Validation
class CustomPasswordWithoutValInputField extends StatefulWidget {
  CustomPasswordWithoutValInputField(
      {super.key, required this.inputController,
        required this.inputHintText,
        required this.isObscured,
        required this.onPressed,
        this.onFieldSubmitted,
        this.header,
        this.onChanged,
        this.onTap});

  TextEditingController inputController;
  String inputHintText;
  String? header;
  bool isObscured;
  Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  void Function()? onTap;
  VoidCallback onPressed;

  @override
  State<CustomPasswordWithoutValInputField> createState() =>
      _CustomPasswordWithoutValInputFieldState();
}

class _CustomPasswordWithoutValInputFieldState extends State<CustomPasswordWithoutValInputField> {
  bool showHint = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        widget.header == ''
            ? const SizedBox.shrink()
            :  CustomText(
          inputText: widget.header??'',
          fontSize: 14,
          weight: FontWeight.w500,
          color: AppColors.blackColor,),
        SizedBox(height: widget.header == '' ? 0 : 9.h),
        TextFormField(
          controller: widget.inputController,
          obscureText: widget.isObscured ? true : false,
          cursorColor: AppColors.blackColor,
          keyboardType: TextInputType.text,
          autocorrect: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.ash,
            suffix: GestureDetector(
              onTap: widget.onPressed,
              child: Padding(
                padding:
                EdgeInsets.only(right: (10.w)),
                child: Icon(
                  widget.isObscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: AppColors.suffixIconColor,
                  size: (18.sp),
                ),
              ),
            ),
            contentPadding: EdgeInsets.all(10.sp),
            border:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.50)),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
            ),
            hintText: widget.inputHintText,
            hintStyle: GoogleFonts.montserrat(
                fontSize: (14.sp),
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor.withOpacity(0.50)),
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: (value) => value!.isEmpty ? ' ${widget.inputHintText}' : null,
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                showHint = false;
              } else {
                showHint = true;
              }
            });
          },
          onTap: widget.onTap,
        ),
        SizedBox(
          height: (5.h),
        ),
      ],
    );
  }
}

/// Email InputField
class CustomEmailInputField extends StatefulWidget {
  CustomEmailInputField(
      {super.key, required this.inputController,
        required this.inputHintText,
        required this.keyboardType,
        required this.header,
        this.onChanged,
        this.suffix,
        this.onTap});

  TextEditingController inputController;
  String inputHintText;
  String header;
  TextInputType keyboardType;
  void Function(String)? onChanged;
  void Function()? onTap;
  Widget? suffix;

  @override
  State<CustomEmailInputField> createState() => _CustomEmailInputFieldState();
}

class _CustomEmailInputFieldState extends State<CustomEmailInputField> {
  bool showHint = false;

  String? emailValidator(String? value) {
    final String val = value!.trim();
    final RegExp reg =
    RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$");
    if (!reg.hasMatch(val)) {
      return 'Invalid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        widget.header == ''
            ? const SizedBox.shrink()
            :  CustomText(
          inputText: widget.header??'',
          fontSize: 14,
          weight: FontWeight.w500,
          color: AppColors.blackColor,),
        SizedBox(height: widget.header == '' ? 0 : 9.h),
        Center(
          child: TextFormField(
            controller: widget.inputController,
            keyboardType: widget.keyboardType,
            cursorColor: AppColors.blackColor,
            autocorrect: false,
            autofillHints: const [AutofillHints.email],
            autovalidateMode: AutovalidateMode.disabled,
            decoration: InputDecoration(
              filled: false,
              fillColor: AppColors.ash,
              suffix: Padding(
                padding:
                EdgeInsets.only(right: (18.w)),
                child: widget.suffix,
              ),
              contentPadding: EdgeInsets.all(10.sp),
              border:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.50)),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              hintText: widget.inputHintText,
              hintStyle: GoogleFonts.montserrat(
                  fontSize: (14.sp),
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor.withOpacity(0.50)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return widget.inputHintText;
              } else {
                emailValidator(value);
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  showHint = false;
                } else {
                  showHint = true;
                }
              });
            },
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}
