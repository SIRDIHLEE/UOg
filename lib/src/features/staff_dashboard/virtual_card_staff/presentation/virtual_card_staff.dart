import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/custom_text.dart';
import '../../../../constant/colors.dart';

class VirtualCardStaff extends StatefulWidget {
  const VirtualCardStaff({super.key});

  @override
  State<VirtualCardStaff> createState() => _VirtualCardStaffState();
}

class _VirtualCardStaffState extends State<VirtualCardStaff> {
  // Fetch user data from Firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> _fetchUserData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid; // Get the current user ID
    if (userId != null) {
      return FirebaseFirestore.instance.collection('users').doc(userId).get();
    } else {
      throw Exception('User not logged in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: _fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No data available'));
          } else {
            final userData = snapshot.data!.data()!;
            final name = userData['name'] ?? 'New user. Please update your profile';
            final profilePicture = userData['profilePicture'] ?? '';
            final schoolId = userData['SCHOOLID'] ?? '000001111';
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/VIRTUAL_ID page (1).png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 135.h),
                  profilePicture.isNotEmpty
                      ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                        child: Image.network(
                                            profilePicture,
                                            height: 120.h,
                                            width: 120.w,
                                            fit: BoxFit.cover,
                                          ),
                      )
                      : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                        child: Image.asset(
                                            'assets/images/Ellipse 255.png',
                                            height: 120.h,
                                            width: 120.w,
                                            fit: BoxFit.cover,
                                          ),
                      ),
                  SizedBox(height: 85.h),
                  CustomText(
                    inputText: name,
                    textAlign: TextAlign.start,
                    fontSize: 24,
                    weight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 11.h),
                  CustomText(
                    inputText: 'Staff',
                    textAlign: TextAlign.start,
                    fontSize: 11,
                    weight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 28.h),
                  CustomText(
                    inputText: 'ID No: $schoolId',
                    textAlign: TextAlign.start,
                    fontSize: 15,
                    weight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 11.h),
                  CustomText(
                    inputText: 'Department: Science & Engineering',
                    textAlign: TextAlign.start,
                    fontSize: 15,
                    weight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 11.h),
                  CustomText(
                    inputText: 'Institution: University of Greenwich',
                    textAlign: TextAlign.start,
                    fontSize: 15,
                    weight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 68.h),
                  Container(
                    height: 69.h,
                    width: 287.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Image.asset('assets/images/Group 50.png'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
