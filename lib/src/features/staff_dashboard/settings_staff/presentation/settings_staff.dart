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
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/log_out.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/password_changed.dart';
import 'package:uog/src/features/staff_dashboard/settings_staff/presentation/widgets/settings_tiles.dart';
import '../../../../common/alert_dialog.dart';
import '../../../../common/custom_text.dart';
import '../../../../common/custom_textfield.dart';


class SettingsStaff extends StatefulWidget {
  const SettingsStaff({super.key});

  @override
  State<SettingsStaff> createState() => _SettingsStaffState();
}

class _SettingsStaffState extends State<SettingsStaff> {
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool switchValue1 = false;
  bool _isObscured = true;
  String? _profilePicUrl;

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
            _fullName.text = doc['name'] ?? '';
            _phone.text = doc['phone_num'] ?? '';
            _email.text = doc['email'] ?? '';
            _profilePicUrl = doc['profilePicture']; // Handle profile picture URL
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
          'phone_num': _phone.text,
          'email': _email.text,
          'profilePicture': _profilePicUrl, // Save profile picture URL
        }, SetOptions(merge: true)); // Use merge to update if exists, create if not
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


  void _onLogout(){
    FirebaseAuth.instance.signOut();
  }

  Future<void> _updateProfilePic() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        File file = File(image.path);
        String fileName = DateTime.now().toString() + '.jpg';

        try {
          Reference storageRef = FirebaseStorage.instance.ref().child('profile_pics/$fileName');
          UploadTask uploadTask = storageRef.putFile(file);

          // Add a listener to track progress and handle errors
          uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
            // You can add progress logging here if needed
          }).onError((error) {
            print('Upload error: $error');
            throw error; // Re-throw the error to handle it in the catch block
          });

          TaskSnapshot taskSnapshot = await uploadTask;
          String downloadUrl = await taskSnapshot.ref.getDownloadURL();

          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            final userCollection = FirebaseFirestore.instance.collection('users');
            await userCollection.doc(user.uid).set({
              'profilePicture': downloadUrl,
            }, SetOptions(merge: true));

            setState(() {
              _profilePicUrl = downloadUrl;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Profile picture updated successfully')),
            );
          }
        } catch (e) {
          // Enhanced error handling
          print('Error updating profile picture: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error updating profile picture: $e')),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission denied')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No user data found.'));
          } else {
            final data = snapshot.data!.data() as Map<String, dynamic>;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(11.w, 51.h, 11.w, 11.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.arrow_back_outlined),
                      SizedBox(width: 91.w),
                      CustomText(
                        inputText: 'Settings',
                        fontSize: 24,
                        weight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  SettingsCard(
                    profilePicUrl: _profilePicUrl,
                    onProfilePicTap: _updateProfilePic, // Pass the callback
                  ),
                  SizedBox(height: 27.h),
                  CustomText(
                    inputText: 'Profile Settings',
                    fontSize: 18,
                    weight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 16.h),
                  CustomInputField(
                    inputController: _fullName,
                    inputHintText: 'Full Name',
                    keyboardType: TextInputType.text,
                    header: 'Full Name',
                  ),
                  SizedBox(height: 16.h),
                  CustomInputField(
                    inputController: _email,
                    inputHintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    header: 'Email',
                  ),
                  SizedBox(height: 16.h),
                  CustomInputField(
                    inputController: _phone,
                    inputHintText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    header: 'Phone Number',
                  ),
                  SizedBox(height: 27.h),
                  CustomText(
                    inputText: 'Notifications',
                    fontSize: 18,
                    weight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        inputText: 'Push notifications',
                        fontSize: 14,
                        weight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      Transform.scale(
                        scale: 0.75,
                        child: CupertinoSwitch(
                          value: switchValue1,
                          activeColor: AppColors.primaryColor,
                          onChanged: (bool value) {
                            setState(() {
                              switchValue1 = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  CustomText(
                    inputText: 'Notifications preferences',
                    fontSize: 14,
                    weight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  SizedBox(height: 18.h),
                  CustomText(
                    inputText: 'Security',
                    fontSize: 18,
                    weight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 11.h),
                  CustomPasswordInputField(
                    inputController: _password,
                    headerColor: AppColors.openday,
                    inputHintText: 'Password',
                    header: 'Change Password',
                    isObscured: _isObscured,
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  SettingsButtons(onSave: _saveChanges, onLogout: _onLogout), // Pass the save function
                ],
              ),
            );
          }
        },
      ),
    );
  }
}




class SettingsCard extends StatelessWidget {
  final String? profilePicUrl;
  final VoidCallback onProfilePicTap; // Callback for image tap

  const SettingsCard({
    super.key,
    this.profilePicUrl,
    required this.onProfilePicTap, // Include it in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.settingsBColor,
      ),
      child: Row(
        children: [
          SizedBox(width: 18.w),
          Stack(
            children: [
              GestureDetector(
                onTap: onProfilePicTap, // Trigger the callback on tap
                child: profilePicUrl != null
                    ? Image.network(profilePicUrl!, height: 80.h, width: 80.w, fit: BoxFit.cover)
                    : Image.asset('assets/images/Ellipse 255.png', height: 80.h, width: 80.w, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: GestureDetector(
                  onTap: onProfilePicTap, // Trigger the callback on tap
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 24.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                inputText: 'Rowen Wright',
                fontSize: 20,
                weight: FontWeight.w600,
                color: Colors.black,
              ),
              CustomText(
                inputText: 'Staff ID: 12345',
                fontSize: 16,
                weight: FontWeight.w400,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


