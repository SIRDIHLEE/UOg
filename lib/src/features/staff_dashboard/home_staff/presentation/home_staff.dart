import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uog/src/common/custom_text.dart';
import 'package:uog/src/features/staff_dashboard/home_staff/presentation/widgets/attendance.dart';
import 'package:uog/src/features/staff_dashboard/home_staff/presentation/widgets/today.dart';

import '../../../../constant/colors.dart';

class HomeStaff extends StatefulWidget {
  const HomeStaff({super.key});

  @override
  State<HomeStaff> createState() => _HomeStaffState();
}

class _HomeStaffState extends State<HomeStaff> {
  List<String> secondTabBar = <String>[
    'Today',
    'Attendance',
  ];

  int current = 0;
  String userName = '...'; // Initialize with default value

  final List<Widget> tabs = [
    const Today(),
    const Attendance(),
  ];

  @override
  void initState() {
    super.initState();
    fetchUserName(); // Fetch the user name
  }

  Future<void> fetchUserName() async {
    final userId = FirebaseAuth.instance.currentUser?.uid; // Get the current user ID
    if (userId != null) {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (userDoc.exists) {
        setState(() {
          userName = userDoc.data()?['name'] ?? 'New user';
        });
      }
    }
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        SizedBox(
          height: 34.h,
          child: ListView.builder(
            itemCount: secondTabBar.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.only(right: 20.0.w),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Column(
                    children: [
                      Center(
                        child: CustomText(
                          inputText: secondTabBar[index],
                          textAlign: TextAlign.center,
                          fontSize: 16,
                          weight: FontWeight.w600,
                          color: current == index
                              ? AppColors.blackColor
                              : AppColors.textColor2.withOpacity(0.90),
                        ),
                      ),
                      Container(
                        height: 2.h,
                        width: 50.w,
                        color: current == index
                            ? AppColors.blackColor
                            : AppColors.scaffoldBackground,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(18.w, 48.h, 18.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  inputText: 'Hi, $userName', // Use the fetched name here
                  fontSize: 16,
                  weight: FontWeight.w600,
                  color: Colors.black,
                ),
                const Spacer(),
                Icon(
                  Iconsax.notification,
                  size: 20.sp,
                ),
                SizedBox(width: 7.w),
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                )
              ],
            ),
            SizedBox(height: 12.h),
            _buildTabBar(),
            Expanded(child: tabs[current]),
          ],
        ),
      ),
    );
  }
}
