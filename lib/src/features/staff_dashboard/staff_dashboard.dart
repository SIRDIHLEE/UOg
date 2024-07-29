import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/dashboard/profile/presentation/views/profile.dart';
import 'package:uog/src/features/dashboard/settings/presentation/views/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uog/src/features/staff_dashboard/home_staff/presentation/home_staff.dart';
import 'package:uog/src/features/staff_dashboard/message_staff/presentation/message_staff.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/settings_staff.dart';
import 'package:uog/src/features/staff_dashboard/virtual_card_staff/presentation/virtual_card_staff.dart';

class StaffDashBoard extends StatefulWidget {
  const StaffDashBoard({super.key, });

  @override
  State<StaffDashBoard> createState() => _StaffDashBoardState();
}


class _StaffDashBoardState extends State<StaffDashBoard> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeStaff(),
    const MessageStaff(),
    const SettingsStaff(),
    const VirtualCardStaff(),
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
          _buildBottomNavigationBarItem(1, Iconsax.message, 'Message'),
          _buildBottomNavigationBarItem(2, Iconsax.setting_24, 'Settings'),
          _buildBottomNavigationBarItem(3, Iconsax.card, 'Virtual ID'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle:  GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        unselectedLabelStyle:  GoogleFonts.montserrat(
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
            color: _currentIndex == index ? AppColors.navBColor : Colors.transparent,
          ),
          child: Icon(icon,size:18,color: _currentIndex == index ? Colors.white : Colors.black),
        ),
      ),
      label: label,
    );
  }
}

