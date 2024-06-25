// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, duplicate_ignore, must_be_immutable, unnecessary_brace_in_string_interps, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/HelperMaterial/enum.dart';
import 'package:fyp/Models/customer_model.dart';
import 'package:fyp/Screens/UserProfile/components/body.dart';
import 'package:fyp/Screens/UserProfile/components/custom_bar.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
import 'package:get/get.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static String routeName = '/profile';
  final String name;
  final String email;
  final String profilePicture;
  const ProfileScreen(
      {required this.name, required this.email, required this.profilePicture});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

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
              children: [
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Make the container circular
                        color: Colors
                            .transparent, // Set container color to transparent
                        border: Border.all(
                            color: Colors.white, width: 2), // Add border
                      ),
                      child: ClipOval(
                          child: Image.network(
                        widget.profilePicture,
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit
                            .cover, // Ensure the image covers the entire circular area
                      )),
                    ),
                  ],
                ),
                Text(
                  'Name:${widget.name}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                Text(
                  'Email:${widget.email}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 20,
                ),
                Body(profilePic: widget.profilePicture),
              ],
            ),
          ),
        )
        // child:NavigationBar(NavBarScreen()),
        //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),

        );
  }
}
