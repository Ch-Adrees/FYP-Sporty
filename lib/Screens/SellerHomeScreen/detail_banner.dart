// ignore_for_file: unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import '../CompleteProfile/complete_profile_form.dart';

class DetailBanner extends StatelessWidget {
  DetailBanner(
      {super.key,
      required this.name,
      required this.shopName,
      required this.profilePicture});
  final String name;
  final String shopName;
  final String? profilePicture;
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
                child: profilePicture != null
                    ? Image.network(
                        profilePicture!,
                        width: 80.0,
                        height: 90.0,
                      )
                    : SvgPicture.asset(
                        "assets/icons/username-icon.svg",
                        width: 80.0,
                        height: 90.0,
                        color: Colors.white,
                      ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    shopName,
                    style: const TextStyle(
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
        ],
      ),
    );
  }
}
