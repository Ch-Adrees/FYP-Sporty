import 'package:flutter/material.dart';
import 'package:fyp/Screens/onBoardingScreen/onboardscreen.dart';
import 'package:fyp/Screens/SignInScreen/sigin.dart';
import 'package:fyp/Screens/SignupScreen/signup.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
//import 'package:fyp/Screens/navigation_bar.dart';




final Map<String,WidgetBuilder> listOfRoutes={
  //NavBarScreen.routeName: (context) => const NavBarScreen(),
  OnBoardScreen.routeName:(context)=>const OnBoardScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),

};
