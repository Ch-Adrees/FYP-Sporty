import 'package:flutter/material.dart';
import 'package:fyp/Screens/UserProfile/edit_profile_form.dart';
import '../../HelperMaterial/constant.dart';

class SellerEditProfileScreen extends StatelessWidget {
  const SellerEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
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
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                 SizedBox(
                  height: 16,
                ),
                EditProfileForm(),
                const SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
