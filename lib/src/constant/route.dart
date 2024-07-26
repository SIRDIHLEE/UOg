import 'package:flutter/material.dart';
import 'package:uog/src/students/dashboard/messages/nomessage.dart';
import 'package:uog/src/students/dashboard/notification/notifications.dart';
import 'package:uog/src/students/dashboard/qrcode/qrcode.dart';

import '../features/auth/presentation/views/signIn.dart';
import '../features/dashboard/dashboard.dart';
import '../features/onboarding/presentation/views/onboarding.dart';

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
    // splash : (context) =>  const SplashScreen(),
    splash : (context) =>  const QrCodeScreen(),
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