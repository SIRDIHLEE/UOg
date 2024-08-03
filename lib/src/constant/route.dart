import 'package:flutter/material.dart';
import 'package:uog/src/features/staff_dashboard/home_staff/presentation/widgets/students.dart';
import 'package:uog/src/features/staff_dashboard/staff_dashboard.dart';
import 'package:uog/src/students/dashboard/idcard/id.dart';
import 'package:uog/src/students/dashboard/messages/nomessage.dart';
import 'package:uog/src/students/dashboard/notification/notifications.dart';
import 'package:uog/src/students/dashboard/qrcode/qrcode.dart';

import '../features/auth/presentation/views/signIn.dart';
import '../features/dashboard/dashboard.dart';
import '../features/dashboard/discover/presentation/views/bus_service.dart';
import '../features/dashboard/discover/presentation/views/career.dart';
import '../features/dashboard/discover/presentation/views/tours.dart';
import '../features/dashboard/home/presentation/views/annoucement.dart';
import '../features/event/events.dart';
import '../features/happenings/whatishappening.dart';
import '../features/onboarding/presentation/views/onboarding.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../features/onboarding/presentation/views/splash_screen.dart';
import '../features/openday/openday.dart';
import '../students/dashboard/dashboard.dart';
import '../students/dashboard/student-dashboard.dart';

class Routes {
  //screens
  static const splash = '/';
  static const onboarding = 'onboarding';
  static const signIn = 'signIn';
  static const dashboard = 'dashboard';
  static const guestDashboard = 'guestDashboard';
  static const staffDashboard = 'staffDashboard';
  static const studentsScreen = 'studentsScreen';
  static const openDay = 'openDay';
  static const busService = 'busService';
  static const announcementScreen = 'announcementScreen';
  static const whatIsHappeningScreen = 'whatIsHappeningScreen';
  static const eventsScreen = 'eventsScreen';
  static const careerScreen = 'careerScreen';
  static const tours = 'tours';


  //routes
  static final routes = <String, Widget Function(BuildContext)>{
    // splash : (context) =>  const SplashScreen(),
    // splash : (context) =>  const IdCardScreen(),
    splash: (context) => const SplashScreen(),
    onboarding: (context) => const OnBoarding(),
    studentsScreen: (context) => const StudentsScreen(),
    staffDashboard: (context) => const StaffDashBoard(),
    whatIsHappeningScreen: (context) => const WhatIsHappeningScreen(),
    guestDashboard: (context) => const DashBoard(),
    eventsScreen: (context) => const EventsScreen(),
    openDay: (context) => const OpenDay(),
    tours: (context) => const Tours(),
    careerScreen: (context) => const CareerScreen(),
    announcementScreen: (context) => const AnnouncementScreen(),
    busService: (context) => const BusService(),
    signIn: (context) =>
        StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final User? user = snapshot.data;
                return const StudentDashBoard();
              } else {
                return const SignIn();
              }
            }
        ),
    dashboard: (context) => const StudentDashBoard(),
  };

}