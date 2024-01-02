import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/app_themes.dart';
import 'package:fyp/Screens/AllProducts/products_page.dart';
import 'Screens/onBoardingScreen/onboardscreen.dart';
import 'HelperMaterial/routes.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_home_screen.dart';
import 'package:fyp/Screens/CompleteProfile/complete_profile_screen.dart';



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
      home: const ProductPage(),
      // initialRoute: OnBoardScreen.routeName,
      // routes: listOfRoutes,
    );
  }
}
