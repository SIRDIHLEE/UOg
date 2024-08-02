import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uog/src/common/custom_text.dart';
import 'package:uog/src/constant/colors.dart';


class OpenDayTextField extends StatefulWidget {
  OpenDayTextField(
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
  State<OpenDayTextField> createState() => _OpenDayTextFieldState();
}

class _OpenDayTextFieldState extends State<OpenDayTextField> {
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
          weight: FontWeight.w600,
          color: AppColors.iconColor,),
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