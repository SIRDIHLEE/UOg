import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/happenings/whatishappeningwidget.dart';

import '../../common/custom_text.dart';

class WhatIsHappeningScreen extends StatelessWidget {
  const WhatIsHappeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title: CustomText(
          inputText: "What's Happening",
          textAlign: TextAlign.start,
          fontSize: 20,
          weight: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
         WhatIsHappeningWidget(heading: "Civil engineering", date: "Sep 20, 2024", subtext: "Your opportunity to learn more directly from our\n lecturers.", image: Image.asset("assets/images/happen1.png")),
         WhatIsHappeningWidget(heading: "Guest Lecture", date: "Sep 20, 2024", subtext: "Join us for an insightful lecture on the impact of AI \nin healthcare", image: Image.asset("assets/images/happen2.png")),
         WhatIsHappeningWidget(heading: "Career Fair", date: "Sep 20, 2024", subtext: "Meet potential employees and explore career \nopportunities", image: Image.asset("assets/images/happen3.png")),
         WhatIsHappeningWidget(heading: "Open Day", date: "Sep 20, 2024", subtext: "Participate in various sports activities and\n competitions", image: Image.asset("assets/images/happen4.png"))
        ],
      ),
    );
  }
}

