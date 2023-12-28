import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/ForgetPassword/forget_pass_form.dart';
 
class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});
  static String routeName = "/forget_pass";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Forget Password',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.0,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter your email and we will send \nyou an OTP to change your password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ForgotPassForm(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
