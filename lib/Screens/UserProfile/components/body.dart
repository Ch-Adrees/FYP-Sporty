// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:fyp/Screens/UserProfile/components/profile_menu.dart';
import 'package:fyp/Screens/UserProfile/edit_profile_screen.dart';
import 'package:fyp/Screens/MyAdsScreen/myads.dart';
import 'package:fyp/Screens/SignInScreen/sigin.dart';
import 'package:fyp/Screens/WalletScreen/mywallet.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          ProfileMenu(
            icon: "assets/icons/User Icon.svg",
            text: "Edit Profile",
            press: () {
              Navigator.pushReplacementNamed(
                  context, EditProfileScreen.routeName);
            },
          ),
          ProfileMenu(
            icon: "assets/icons/Cart Icon.svg",
            text: "My Orders",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/Heart Icon.svg",
            text: "My Post",
            press: () {
              Navigator.pushReplacementNamed(context,MyAdsScreen.routeName);
            },
          ),
          ProfileMenu(
            icon: "assets/icons/Bill Icon.svg",
            text: "My Wallet",
            press: () { 
              Navigator.pushReplacementNamed(context,WalletScreen.routeName);
      
            },
          ),
          ProfileMenu(
            icon: "assets/icons/Log out.svg",
            text: "Log-Out",
            press: () {
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}