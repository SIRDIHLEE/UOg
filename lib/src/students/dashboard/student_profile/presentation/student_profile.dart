import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uog/src/common/custom_button.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/auth/presentation/views/signIn.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/log_out.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/password_changed.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/settings_tiles.dart';
import 'package:uog/src/students/dashboard/student_profile/presentation/widgets/student_settings.dart';
import '../../../../common/alert_dialog.dart';
import '../../../../common/custom_text.dart';
import '../../../../common/custom_textfield.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  final _fullName = TextEditingController();
  bool switchValue1 = false;
  bool _isObscured = true;
  String? _profilePicUrl;
  String? _tempProfilePicUrl;
  String _displayName = 'New User'; // Default name
  String _schoolId = '000011111'; // Default school ID

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userCollection = FirebaseFirestore.instance.collection('users');
      final docRef = userCollection.doc(user.uid);

      try {
        DocumentSnapshot doc = await docRef.get();

        if (doc.exists) {
          setState(() {
            _fullName.text = doc['name'] ?? 'New User';
            _profilePicUrl = doc['profilePicture'] ?? 'https://path-to-your-default-image.jpg';
            _displayName = _fullName.text.isEmpty ? 'New User' : _fullName.text;
            _schoolId = doc['SCHOOLID'] ?? '000011111';
          });
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading user data: $e')),
        );
      }
    }
  }

  Future<void> _saveChanges() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userCollection = FirebaseFirestore.instance.collection('users');
      final docRef = userCollection.doc(user.uid);

      try {
        await docRef.set({
          'name': _fullName.text,
          'profilePicture': _profilePicUrl,
        }, SetOptions(merge: true));

        // Update the local state to reflect the changes
        setState(() {
          _displayName = _fullName.text.isEmpty ? 'New User' : _fullName.text;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating profile: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not signed in')),
      );
    }
  }


  void _onLogout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
  }

  void _showLogoutDialog(BuildContext context) {
    CustomAlertDialog.showAlertDialog(
      context: context,
      height: 155.h,
      isDissmisable: false,
      child: LogOut(
        onConfirmLogout: () {
          Navigator.of(context).pop(); // Close the dialog
          _onLogout(); // Call the logout function
        },
        onCancel: () {
          Navigator.of(context).pop(); // Close the dialog
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, size: 32.w,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(11.w, 0.h, 11.w, 11.h),
        child: Center(
          child: Column(
            children: [
              Text("Edit", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),),
                  SizedBox(height: 12.h,),
              SettingsCard(
                profilePicUrl: _profilePicUrl,
                displayName: _displayName,
                onProfilePicTap: (){},
                schoolId: _schoolId,
              ),
              SizedBox(height: 104.h),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF364E68),
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Column(
                  children: [
                    ListTile(
                        title: Text("Push Notifications", style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500),),
                        leading: Icon(Icons.notifications_none, color: Colors.white, size: 20.06.h,),
                        trailing: Transform.scale(
                          scale: 0.75,
                          child: CupertinoSwitch(
                            value: switchValue1,
                            activeColor: Colors.white,
                            thumbColor: Colors.white,
                            trackColor: Colors.white,
                            onChanged: (bool value) {
                              setState(() {
                                switchValue1 = value;
                              });
                            },
                          ),
                        ),
                    ),
                    ListTile(
                      title: Text("Settings", style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500),),
                      leading: Icon(Icons.settings, color: Colors.white, size: 20.06.h,),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentSettings()));
                        },
                        icon: Icon(Icons.chevron_right, color: Colors.white, size: 32.w,),
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 180.h),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF364E68),
                    borderRadius: BorderRadius.circular(10.r)
                ),
                child: Column(
                  children: [
                    ListTile(
                        title: Text("Help & Support", style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500),),
                    ),
                    ListTile(
                      title: Text("FAQ", style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500),),
                    ),
                    ListTile(
                      title: GestureDetector(
                          onTap: (){_showLogoutDialog(context);},
                          child: Text("Logout", style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500),)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String? profilePicUrl;
  final String displayName;
  final String schoolId;
  final VoidCallback onProfilePicTap;

  const SettingsCard({
    super.key,
    this.profilePicUrl,
    required this.displayName,
    required this.schoolId,
    required this.onProfilePicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: onProfilePicTap,
              child: profilePicUrl != null && profilePicUrl!.isNotEmpty
                  ? ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.network(
                                      profilePicUrl!,
                                      height: 80.h,
                                      width: 80.w,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Image.asset(
                        'assets/images/ugo_profile.jpg',
                        height: 80.h,
                        width: 80.w,
                        fit: BoxFit.cover,
                      ),
                    );
                                      },
                                    ),
                  )
                  : Image.asset(
                'assets/images/Ellipse 255.png',
                height: 80.h,
                width: 80.w,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 8.h,
              right: 8.w,
              child: GestureDetector(
                onTap: onProfilePicTap,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 24.h,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height:  20.h),
        CustomText(
          inputText: displayName,
          fontSize: 20,
          weight: FontWeight.w600,
          color: Colors.black,
        ),
        CustomText(
          inputText: 'Student ID: $schoolId',
          fontSize: 16.sp,
          weight: FontWeight.w400,
          color: Colors.black,
        ),
      ],
    );
  }
}


