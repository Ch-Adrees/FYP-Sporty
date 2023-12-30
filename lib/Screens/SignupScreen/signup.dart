import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/SignupScreen/signupform.dart';
import 'package:fyp/HelperMaterial/social_card.dart';
import 'package:fyp/HelperMaterial/no_account_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static String routeName = "/signUp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Sign Up',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.0,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Register Account',
                    style: headingStyle,
                  ),
                  const Text(
                    'Complete your details or continue\n with Social Media',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const SignUpForm(),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                        text: 'Google',
                      ),
                      SocialCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                        text: 'Facebook',
                      ),
                      SocialCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                        text: 'Twitter',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
