import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/dashboard/profile/presentation/views/profile.dart';
import 'package:uog/src/features/dashboard/settings/presentation/views/settings.dart';
import 'package:uog/src/students/dashboard/messages/messages.dart';

// import 'discover/presentation/views/discover.dart';
// import 'home/presentation/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uog/src/students/dashboard/qrcode/qrcode.dart';
import 'package:uog/src/students/dashboard/schedule/schedule_screen.dart';

import 'dashboard.dart';
import 'idcard/id.dart';

class StudentDashBoard extends StatefulWidget {
  final User? user;
  const StudentDashBoard({super.key, this.user});

  @override
  State<StudentDashBoard> createState() => _StudentDashBoardState();
}


class _StudentDashBoardState extends State<StudentDashBoard> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const StudentDashboardScreen(),
    const ScheduleScreen(),
    const QrCodeScreen(),
    const MessagesScreen(),
    // const VirtualScreen(),
    const IdCardScreen(),
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
          _buildBottomNavigationBarItem(1, Iconsax.calendar, 'Schedule'),
          _buildBottomNavigationBarItem(2, Iconsax.barcode, 'Scan Code'),
          _buildBottomNavigationBarItem(3, Iconsax.message, 'Messages'),
            _buildBottomNavigationBarItem(4, Iconsax.message, 'Virtual ID'),
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

