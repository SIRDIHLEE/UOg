import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';

import '../../../../../common/custom_text.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

bool _dropdownVal = false;
bool _faqdropDownVal = false;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title: CustomText(
          inputText: 'Settings',
          textAlign: TextAlign.start,
          fontSize: 20,
          weight: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const Divider(
              thickness: 1.0,
            ),
            const SizedBox(
              height: 10,
            ),
            ExpansionTile(
              title:CustomText(
                inputText: 'Account settings',
                textAlign: TextAlign.start,
                fontSize: 15,
                weight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
              trailing: _dropdownVal
                  ? const Icon(Icons.keyboard_arrow_down)
                  : const Icon(Icons.keyboard_arrow_down),

              // IconButton(
              //     onPressed: (){},
              //     icon: const Icon(Icons.keyboard_arrow_down)),
              children:  [
                ListTile(
                  title:CustomText(
                    inputText: 'Switch to staff/student account',
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    weight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                )
              ],
              onExpansionChanged: (value) {
                setState(() {
                  _dropdownVal = value;
                });
              },
            ),
            const Divider(
              height: 2,
            ),
            ExpansionTile(
              title: CustomText(
                inputText: 'FAQ',
                textAlign: TextAlign.start,
                fontSize: 15,
                weight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
              trailing: _faqdropDownVal
                  ? const Icon(Icons.keyboard_arrow_down)
                  : const Icon(Icons.keyboard_arrow_down),

              // IconButton(
              //     onPressed: (){},
              //     icon: const Icon(Icons.keyboard_arrow_down)),
              children:  [
                ListTile(
                  title:CustomText(
                    inputText: 'FAQ',
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    weight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                )
              ],
              onExpansionChanged: (value) {
                setState(() {
                  _faqdropDownVal = value;
                });
              },
            ),
            const Divider(
              height: 2,
            ),
             Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    inputText: 'About this app',
                    textAlign: TextAlign.start,
                    fontSize: 15,
                    weight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 15.h,),
                  CustomText(
                    inputText: 'Update available',
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    weight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
