import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/CompleteProfile/complete_profile_form.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key,required this.userId});
  static String routeName = "/complete_profile";
  final String userId;

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
      body:  SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 16,
                ),
                CompleteProfileForm(userId: userId,),
              const  SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
