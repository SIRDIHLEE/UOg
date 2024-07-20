import 'package:flutter/material.dart';
import 'package:uog/src/features/announcement/annoucement.dart';
import 'package:uog/src/features/busservice/busservice.dart';
import 'package:uog/src/features/dashboard/settings/presentation/views/settings.dart';
import 'package:uog/src/features/event/events.dart';
import 'package:uog/src/features/happenings/whatishappening.dart';
import 'package:uog/src/features/jobs&career/jobs.dart';
import 'package:uog/src/features/openday/openday.dart';
import 'package:uog/src/features/virtualtours/virtual_tours.dart';

import '../features/auth/presentation/views/signIn.dart';
import '../features/dashboard/dashboard.dart';
import '../features/onboarding/presentation/views/onboarding.dart';
import '../features/onboarding/presentation/views/splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Routes{
  //screens
  static const splash = '/';
  static const onboarding = 'onboarding';
  static const signIn = 'signIn';
  static const dashboard = 'dashboard';



  //routes
  static final routes = <String, Widget Function(BuildContext)>{
    splash : (context) =>  const SplashScreen(),
    // splash : (context) =>  const VirtualToursScreen(),
    onboarding : (context) =>  const OnBoarding(),
    signIn : (context) =>  StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges() ,
      builder: (context, snapshot) {
        if(snapshot.hasData == true){
          final User? user = snapshot.data;
          return  DashBoard(user: user);
        }else{
           return const SignIn();
        }
       
      }
    ),
    // dashboard : (context) =>  const DashBoard(),
  };
}