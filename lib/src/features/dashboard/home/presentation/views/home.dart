import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';

import '../../../../../common/custom_text.dart';
import '../widgets/announcements_tile.dart';
import '../widgets/date_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          const HomeDateCard(),
          Padding(
            padding:  EdgeInsets.fromLTRB(10.w, 9.h, 10.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AnnouncementsTile(),
                SizedBox(height: 20.h,),
                CustomText(
                  inputText: "Whats happening?",
                  textAlign: TextAlign.center,
                  fontSize: 15,
                  weight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ],
            ),
          ),



        ],
      ),
    );
  }
}


