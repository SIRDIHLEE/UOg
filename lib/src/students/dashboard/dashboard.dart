import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/busservice/busservice.dart';
import 'package:uog/src/features/staff_dashboard/staff_dashboard.dart';
import 'package:uog/src/students/dashboard/student_attendance/student_attendance.dart';
import 'package:uog/src/students/dashboard/student_profile/presentation/student_profile.dart';

import 'library/library.dart';
import 'module/module.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  _StudentDashboardScreenState createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  String temperature = '...';
  String date = '';
  String userName = '...'; // Initialize with default value
  String profilePictureUrl = '';
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  bool showToday = true;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
    fetchCurrentDate();
    fetchUserData();
    // No need to fetch user name here, we'll use StreamBuilder instead
  }

  Future<void> fetchUserData() async {
    final userId =
        FirebaseAuth.instance.currentUser?.uid; // Get the current user ID
    if (userId != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        setState(() {
          userName = userDoc.data()?['name'] ?? 'New user';
          profilePictureUrl = userDoc.data()?['profilePicture'] ??
              ''; // Fetch the profile picture URL
        });
      }
    }
  }

  Future<void> fetchWeatherData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=London&units=metric&appid=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        temperature = '${data['main']['temp'].toStringAsFixed(0)}\u2103';
      });
    } else {
      setState(() {
        temperature = 'Error';
      });
    }
  }

  void fetchCurrentDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, d MMMM').format(now);
    setState(() {
      date = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final userData = snapshot.data?.data() as Map<String, dynamic>?;
                final name = userData?['name'] ?? 'New User';
                return Text(
                  "Hi, $name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                );
              }
              return Text(
                "Hi, ...",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/noti.png",
                    color: Colors.black,
                    height: 25,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentProfile(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: profilePictureUrl.isNotEmpty
                        ? NetworkImage(profilePictureUrl)
                        : null,
                    child: profilePictureUrl.isEmpty
                        ? Icon(Icons.person, size: 20.sp, color: Colors.white)
                        : null,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showToday = true;
                    });
                  },
                  child: Text(
                    "Today",
                    style: TextStyle(
                      decoration: showToday
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showToday = false;
                    });
                  },
                  child: Text(
                    "Modules",
                    style: TextStyle(
                      decoration: !showToday
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: showToday ? buildTodayContent() : buildModulesContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTodayContent() {
    return ListView(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFF1D224E),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.0, 1.0),
            ),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 16, 0, 0),
                    child: Text(
                      temperature,
                      style: const TextStyle(
                        fontSize: 45,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                    child: Text("United Kingdom\nLondon",
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                child: Column(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Expanded(
                        child: Text(
                      "⛅ Light rain|Remember \nto carry a light jacket",
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 11),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          child: Image.asset("assets/images/banner.png"),
        ),
        SizedBox(height: 20),
        Container(
            height: 350,
            decoration: BoxDecoration(
                color: AppColors.scaffoldBackground,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Campus Service",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const ScrollPhysics(),
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Busservice()));
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/dash1.png",
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Bus Service",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            // Handle tap on campus tour image
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/dash2.png",
                              ),
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Campus Tour",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            // Handle tap on attendance image
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/dash4.png",
                              ),
                              const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Accomodation",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  "Social & Extracuricular",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset(
                        "assets/images/cam2.png",
                      ),
                      SizedBox(width: 8),
                      Image.asset(
                        "assets/images/cam1.png",
                      ),
                      SizedBox(width: 8),
                      Image.asset(
                        "assets/images/camp4.png",
                      ),
                    ],
                  ),
                ))
              ],
            )),
        const Text(
          "Nearest Eateries",
          style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: const Text(
              "Library Support",
              style: TextStyle(color: AppColors.textColor, fontSize: 18),
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LibraryScreen()));
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: AppColors.textColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: const Text(
              "View My Attendance",
              style: TextStyle(color: AppColors.textColor, fontSize: 18),
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentAttendance()));
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: AppColors.textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildModulesContent() {
    return const ModuleOverviewScreen();
  }
}
