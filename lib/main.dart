import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/app_themes.dart';
import 'Screens/onBoardingScreen/onboardscreen.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
import 'HelperMaterial/routes.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sporty App',
      theme: AppTheme.lightTheme(context),
      home: const HomeScreen(),
      // initialRoute: OnBoardScreen.routeName,
      // routes: listOfRoutes,
    );
  }
}
