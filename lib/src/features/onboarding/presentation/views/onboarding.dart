import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/constant/colors.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/custom_text.dart';
import '../../../../constant/route.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  PageController _controller1 = PageController();
  int selectedIndex = 0;
  //late GifController _controllerGif ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            children: [
              SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    inputText: "Skip",
                    textAlign: TextAlign.center,
                    fontSize: 14,
                    weight: FontWeight.normal,
                    color: AppColors.blackColor,
                    fontFamily: '',
                  ),
                ],
              ),
              SizedBox(height: 30.h,),
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _controller1,
                  onPageChanged: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  itemBuilder: (context, i) {
                    var details = demo_data[i];
                    return buildOnboardContent(
                      image: details.image,
                      title: details.title,
                      subtitle: details.subtitle, title_: details.title_,
                    );
                  },
                ),
              ),
              SizedBox(
                height: (30.h),
              ),
              Column(
                children: [
                  CustomButton(
                    title:  selectedIndex == 2?'Get Started': 'Next',
                    borderRadius: 10,
                    onPressed: () {
                      selectedIndex==2?
                      Navigator.pushReplacementNamed(context, Routes.signIn):
                      _controller1.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),
                   SizedBox(
                    height: (36.h),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer _buildIndicator(BuildContext context, int index) =>
      AnimatedContainer(
        height: (5.h),
        width: (20.w),
        margin: EdgeInsets.only(right: (4.sp)),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? AppColors.primaryColor
              : AppColors.greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(
          milliseconds: 100,
        ),
        curve: Curves.decelerate,
      );

  Column buildOnboardContent({
    required String image,
    required String title,
    required String title_,
    required String subtitle,
  }) {
    return Column(
      children: [
        Image.asset(
          image,
          width: double.infinity,
        ),
        SizedBox(
          height: 25.h,
        ),
        RichText(
          textAlign: TextAlign.center,
          text:  TextSpan(
            text: title,
            style:  TextStyle(
              color: AppColors.primaryColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: title_,
                  style:  TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
         SizedBox(
          height: (13.h),
        ),
        CustomText(
          inputText: subtitle,
          textAlign: TextAlign.center,
          fontSize: 14,
          weight: FontWeight.normal,
          color: AppColors.blackColor,
          fontFamily: '',
        ),
        SizedBox(
          height: (36.h),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              demo_data.length, (index) => _buildIndicator(context, index)),
        )
      ],
    );
  }
}

class OnBoard {
  final String image, title,title_,subtitle;

  OnBoard({required this.image,
    required this.title,
    required this.subtitle, required this.title_});
}

final List<OnBoard> demo_data = [
  OnBoard(
      image: 'assets/images/rafiki.png',
      title: 'Digital Student',
      title_ :"\nID CARD",
      subtitle:
          'No more digging through your backpack for your student ID (we know it’s in there somewhere).'),
  OnBoard(
      image: 'assets/images/pana.png',
      title: 'QR Code',
      title_: '\nScan & Attend',
      subtitle: 'No more website logins, just tap and scan!'),
  OnBoard(
    image: 'assets/images/rafiki.png',
    title: 'Ask Your ',
    title_: 'Lecturer!',
    subtitle: 'Converse with confidence, like you’re talking to an old friend.',
  ),
];
