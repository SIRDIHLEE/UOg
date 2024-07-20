import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/dashboard/profile/presentation/views/profile.dart';
import 'package:uog/src/features/dashboard/settings/presentation/views/settings.dart';

import 'discover/presentation/views/discover.dart';
import 'home/presentation/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashBoard extends StatefulWidget {
  final User? user;
  const DashBoard({super.key, this.user});

  @override
  State<DashBoard> createState() => _DashBoardState();
}


class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const Home(),
    const Discover(),
    const Settings(),
    const Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navColor,
        type:BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          _buildBottomNavigationBarItem(0, Iconsax.home, 'Home'),
          _buildBottomNavigationBarItem(1, Iconsax.discover, 'Discover'),
          _buildBottomNavigationBarItem(2, Iconsax.setting_24, 'Settings'),
          _buildBottomNavigationBarItem(3, Iconsax.profile_circle, 'Profile'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(int index, IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding:  EdgeInsets.only(bottom: 2.h),
        child: Container(
          padding:  EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? AppColors.primaryColor : Colors.white,
          ),
            child: Icon(icon,size:18,color: _currentIndex == index ? Colors.white : Colors.black),
        ),
      ),
      label: label,
    );
  }
}

