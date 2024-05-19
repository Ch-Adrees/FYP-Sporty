// ignore_for_file: unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/HelperMaterial/constant.dart';

import '../CompleteProfile/complete_profile_form.dart';

class DetailBanner extends StatelessWidget {
  DetailBanner({super.key});
  final CompleteProfileFormState _formState = CompleteProfileFormState();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8), // Shadow color
            spreadRadius: 4, // Spread radius
            blurRadius: 6.0, // Blur radius
            offset: const Offset(0, 4), // Offset in x and y directions
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white30,
                radius: 30.0,
                child: SvgPicture.asset(
                  "assets/icons/username-icon.svg",
                  width: 40.0,
                  height: 40.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last, Name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Shop Name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Phone No",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    //style: TextStyle(decoration: TextDecoration.underline),
                    //style: TextButton.styleFrom(foregroundColor: Colors.white, ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    //style: TextStyle(decoration: TextDecoration.underline),
                    //style: TextButton.styleFrom(foregroundColor: Colors.white, ),
                    child: const Text(
                      "Your Wallet",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
