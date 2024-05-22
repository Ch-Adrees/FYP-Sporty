import 'package:flutter/material.dart';
import 'package:fyp/Features/provi_wid.dart';
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
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    ProviderWidgets.showFlutterToast(context, "hanan");
                  },
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset(
                        fit: BoxFit.cover,
                        "assets/images/avatar.png"),
                  ),
                ),
                const Text(
                  "Click to choose profile picture",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                ),
                const CompleteProfileForm(),
                const SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
