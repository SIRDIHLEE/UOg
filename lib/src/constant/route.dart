import 'package:flutter/material.dart';
import 'package:uog/src/features/staff_dashboard/home_staff/presentation/widgets/students.dart';
import 'package:uog/src/features/staff_dashboard/staff_dashboard.dart';
import 'package:uog/src/students/dashboard/idcard/id.dart';
import 'package:uog/src/students/dashboard/messages/nomessage.dart';
import 'package:uog/src/students/dashboard/notification/notifications.dart';
import 'package:uog/src/students/dashboard/qrcode/qrcode.dart';

import '../features/auth/presentation/views/signIn.dart';
import '../features/onboarding/presentation/views/onboarding.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../students/dashboard/student-dashboard.dart';

class Routes {
  //screens
  static const splash = '/';
  static const onboarding = 'onboarding';
  static const signIn = 'signIn';
  static const dashboard = 'dashboard';
  static const staffDashboard = 'staffDashboard';
  static const studentsScreen = 'studentsScreen';

  //routes
  static final routes = <String, Widget Function(BuildContext)>{
    // splash : (context) =>  const SplashScreen(),
    // splash : (context) =>  const IdCardScreen(),
    splash: (context) => const SignIn(),
    onboarding: (context) => const OnBoarding(),
    studentsScreen: (context) => const StudentsScreen(),
    staffDashboard: (context) => const StaffDashBoard(),
    signIn: (context) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final User? user = snapshot.data;
            return const StudentDashBoard();
          } else {
            return const SignIn();
          }
        }),
    dashboard: (context) => const StudentDashBoard(),
  };
}
