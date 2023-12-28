import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen/home_header.dart';
import 'package:fyp/Screens/HomeScreen/ads_slider.dart';
import 'package:fyp/Screens/HomeScreen/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                SizedBox(height: 15),
                HomeHeader(),
                SizedBox(height: 25),
                AdsSlider(),
                SizedBox(height: 25),
                Category(),
                SizedBox(height: 25),


              ],
            ),
      )),
    );
  }
}
