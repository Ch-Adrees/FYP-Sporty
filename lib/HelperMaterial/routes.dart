import 'package:flutter/material.dart';
import 'package:fyp/Screens/onBoardingScreen/onboardscreen.dart';
import 'package:fyp/Screens/SignInScreen/sigin.dart';
import 'package:fyp/Screens/SignupScreen/signup.dart';




final Map<String,WidgetBuilder> listOfRoutes={
  OnBoardScreen.routeName:(context)=>const OnBoardScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),

};
