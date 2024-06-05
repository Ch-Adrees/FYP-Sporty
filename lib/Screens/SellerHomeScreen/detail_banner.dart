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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
              Container(
                height: 100,
                width: 100,
                // padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Make the container circular
                  color:
                      Colors.transparent, // Set container color to transparent
                  border:
                      Border.all(color: Colors.white, width: 2), // Add border
                ),
                child: ClipOval(
                  child: profilePicture != null
                      ? Image.network(
                          profilePicture!,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit
                              .cover, // Ensure the image covers the entire circular area
                        )
                      : SvgPicture.asset(
                          "assets/icons/username-icon.svg",
                          width: 80.0,
                          height: 80.0,
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Shop Name: ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: Text(
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          shopName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
