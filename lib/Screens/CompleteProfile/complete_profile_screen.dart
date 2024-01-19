import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/CompleteProfile/complete_profile_form.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});
  static String routeName = "/complete_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complete Profile',
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 16,
                ),
                Text("Complete Profile", style: headingStyle),
                Text(
                  "Finish your Profile Setup and \nPersonalize your journey with us",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                CompleteProfileForm(),
                SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
