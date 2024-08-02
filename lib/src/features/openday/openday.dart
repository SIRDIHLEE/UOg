import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/common/custom_button.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/openday/widget/opendaytext.dart';
import 'package:uog/src/features/openday/widget/opendaytextfield.dart';

import '../../common/custom_text.dart';

class OpenDay extends StatefulWidget {
  const OpenDay({super.key});

  @override
  State<OpenDay> createState() => _OpenDayState();
}

class _OpenDayState extends State<OpenDay> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _subject = TextEditingController();
  final List<String> study = [
   'Greenwich Business School',
    'Faculty of Education & Human Sciences',
    'Faculty of Engineering and Science',
    'Faculty of Liberal Arts and Sciences',
  ];

  String? selectedStudy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title: CustomText(
          inputText: 'Open Days',
          textAlign: TextAlign.start,
          fontSize: 20,
          weight: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.h, right: 9.w, left: 9.w,bottom: 20.h),
        child: Column(
          children: [
            Stack(children: [
              Image.asset("assets/images/openday.png"),
              Padding(
                padding: EdgeInsets.only(top: 142.0.h, right: 6.w, left: 6.w,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      inputText: 'Next Open Day',
                      textAlign: TextAlign.start,
                      fontSize: 14,
                      weight: FontWeight.w600,
                      color: AppColors.scaffoldBackground,
                    ),
                    CustomText(
                      inputText: 'Saturday 17th August',
                      textAlign: TextAlign.start,
                      fontSize: 14,
                      weight: FontWeight.w600,
                      color: AppColors.scaffoldBackground,
                    ),
                  ],
                ),
              )
            ]),
            SizedBox(
              height: 17.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  inputText: 'What to expect on an Open Day',
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  weight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  inputText:
                      "Open Days give you a great sense of what it’s like to join our student community. As well as exploring our historic campus, you’ll get to take part in exciting taster sessions. These give you an idea of the style of learning you can expect once your course begins",
                  textAlign: TextAlign.start,
                  fontSize: 12,
                  weight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
                 SizedBox(
                  height: 20.h,
                ),
                CustomText(
                  inputText: 'Open Day schedules',
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  weight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),

                const SizedBox(
                  height: 15,
                ),
                OpenDayTextField(
                  inputController: _fullName,
                  inputHintText: 'Name',
                  keyboardType: TextInputType.name,
                  header: 'Name',
                ),
                SizedBox(height: 16.h),
                OpenDayTextField(
                  inputController: _email,
                  inputHintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  header: 'Email Address',
                ),
                SizedBox(height: 16.h),
                CustomText(
                  inputText: 'Area of Study',
                  fontSize: 14,
                  weight: FontWeight.w600,
                  color: AppColors.iconColor,),
                SizedBox(height: 8.h,),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint:  Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Select an Option',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.50),
                            ),
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: study
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: selectedStudy,
                    onChanged: (String? value) {
                      setState(() {
                        selectedStudy = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 54.h,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black26,
                        ),

                      ),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down_sharp,size:24,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),

                      offset: const Offset(0, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                OpenDayTextField(
                  inputController: _subject,
                  inputHintText: 'Enter Subject',
                  keyboardType: TextInputType.text,
                  header: 'Subject',
                ),
                 SizedBox(
                  height: 20.h,
                ),
                CustomButton(onPressed: (){},title: 'Submit',
                borderRadius: 10,buttonColor: AppColors.tour,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
