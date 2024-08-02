import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/constant/route.dart';

import '../../../../../common/custom_text.dart';
import '../../../../staff_dashboard/home_staff/presentation/widgets/service_tile.dart';
import '../../../../staff_dashboard/staff_dashboard.dart';
import '../widgets/announcements_tile.dart';
import '../widgets/date_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final currentPageIndex = (0);
  final pageController = PageController();
  final List<String> imageList = [
    'assets/images/gold.png',
    'assets/images/image 11(1).png',
    'assets/images/image 12(1).png'
  ];
  List<String> secondTabBar = <String>[
    'Campus Maps',
    'Accommodation',
    'Faculties',
  ];

  int current = 0;

  final List<Widget> tabs =[
     const GuestTile(image: 'assets/images/Rectangle.png',),
     const GuestTile(image: 'assets/images/download 2.png',),
     const GuestTile(image: 'assets/images/image 13.png',),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeDateCard(),
            Padding(
              padding:  EdgeInsets.fromLTRB(10.w, 9.h, 10.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AnnouncementsTile(),
                  SizedBox(height: 20.h,),
                  GestureDetector(
                    onTap: (){
                      // Navigator.pushNamed(context, Routes.openDay);
                    },
                    child: CustomText(
                      inputText: "Whats happening?",
                      textAlign: TextAlign.center,
                      fontSize: 15,
                      weight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  SizedBox(
                    height: 240.h,
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: imageList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.whatIsHappeningScreen);
                                },
                                child: Image.asset(
                                  imageList[index],
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: SmoothPageIndicator(
                                controller: pageController,
                                count: imageList.length,
                                effect: CustomizableEffect(
                                  activeDotDecoration: DotDecoration(
                                    width: 10.w,
                                    height: 10.h,
                                    color: AppColors.blackColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  dotDecoration: DotDecoration(
                                    width: 10.w,
                                    height: 10.h,
                                    color: AppColors.scaffoldBackground,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                             ),
                            SizedBox(height: 23.0.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  CustomText(
                    inputText: 'Nearest Eateries',
                    textAlign: TextAlign.start,
                    fontSize: 15,
                    weight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 10.h,),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const EateriesTile();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h,),
            SizedBox(
              width: double.maxFinite,
              height:36.h,
              child: ListView.builder(
                  itemCount: secondTabBar.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding:  EdgeInsets.only(left: 10.0.w,right: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: Container(
                          // height: (40.h),
                          // width: 115.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: current==index?AppColors.primaryColor:Colors.white
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 20.0.w,right: 20.w),
                            child: Center(
                              child: CustomText(
                                inputText: secondTabBar[index],
                                textAlign: TextAlign.center,
                                fontSize: 12,
                                weight: FontWeight.w500,
                                color: current==index?
                                AppColors.settingsBColor:
                                AppColors.blackColor.withOpacity(0.50),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            tabs[current],

          ],
        ),
      ),
    );
  }
}

class GuestTile extends StatelessWidget {
  const GuestTile({
    super.key, required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 14.0.h,left: 10.w,right: 10.w,bottom: 13.h),
      child: Container(
          height: 210.h,width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image:  DecorationImage(
              image: AssetImage(image,),
              fit: BoxFit.cover,
            ),
          ),
      ),
    );
  }
}


