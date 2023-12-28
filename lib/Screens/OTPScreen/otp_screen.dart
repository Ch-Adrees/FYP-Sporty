import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/OTPScreen/otp_form.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static String routeName = "/OTP";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'OTP Verification',
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
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter the OTP that we send \nto your email address",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                OtpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
