import 'package:flutter/material.dart';

import '../features/auth/presentation/views/signIn.dart';
import '../features/dashboard/dashboard.dart';
import '../features/onboarding/presentation/views/onboarding.dart';
import '../features/onboarding/presentation/views/splash_screen.dart';
class Routes{
  //screens
  static const splash = '/';
  static const onboarding = 'onboarding';
  static const signIn = 'signIn';
  static const dashboard = 'dashboard';



  //routes
  static final routes = <String, Widget Function(BuildContext)>{
    splash : (context) =>  const SplashScreen(),
    onboarding : (context) =>  const OnBoarding(),
    signIn : (context) =>  const SignIn(),
    dashboard : (context) =>  const DashBoard(),
  };
}