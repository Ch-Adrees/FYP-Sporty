import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/no_account_text.dart';
import 'package:fyp/Screens/SignInScreen/signinform.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/HelperMaterial/social_card.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String routeName = "/signin";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Sign In',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    const Text(
                      "Welcome Back",
                      style: headingStyle,
                      // style: TextStyle(
                      //   color: Colors.black,
                      //   fontSize: 24,
                      //   fontWeight: FontWeight.bold,
                    ),

                    const Text(
                      "Sign in with your email and password  \nor continue with social media",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 70),
                    const SigninForm(),
                    const SizedBox(height: 90),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialCard(
                          icon: "assets/icons/google-icon.svg",
                          press: () {},
                          text: "Google",
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
      ),
    );
  }
}
