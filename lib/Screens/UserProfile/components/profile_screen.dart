// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, duplicate_ignore, must_be_immutable, unnecessary_brace_in_string_interps, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/HelperMaterial/enum.dart';
import 'package:fyp/Screens/UserProfile/components/body.dart';
import 'package:fyp/Screens/UserProfile/components/custom_bar.dart';
import 'package:fyp/Screens/UserProfile/edit_profile_screen.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  String name, email;
  String? shopName;
  String? profilePicture;
  ProfileScreen( {
    required this.name,
    required this.email,
    this.profilePicture
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.0,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        radius: 50,
                        child:profilePicture != null? Image.network(profilePicture!) :SvgPicture.asset(
                          "assets/icons/username-icon.svg",
                          color: Colors.black45,
                          height: 80,
                          width: 65,
                        )
                      ),
                    ),
                  ],
                ),
                Text(
                  'Name:${name}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                Text(
                  'Email:${email}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 20,
                ),
                Body(profilePic: profilePicture),
              ],
            ),
          ),
        )
        // child:NavigationBar(NavBarScreen()),
        //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),

        );
  }
}
