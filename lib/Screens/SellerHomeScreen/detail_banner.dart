import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';

import '../CompleteProfile/complete_profile_form.dart';

class DetailBanner extends StatelessWidget {
  DetailBanner({super.key});
  CompleteProfileForm formState = CompleteProfileForm();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
