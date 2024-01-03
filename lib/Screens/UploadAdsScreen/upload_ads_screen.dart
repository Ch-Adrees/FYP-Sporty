import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/UploadAdsScreen/upload_ads_form.dart';

class UploadAds extends StatelessWidget {
  const UploadAds({super.key});
  static String routeName = "/upload_ads";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Upload Product',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.0,
              color: kPrimaryColor,
            ),
          ),
        ),
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
                Text("Upload Product", style: headingStyle),
                Text(
                  "Showcase your business by uploading \nyour product and captivate your audience",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                UploadAdsForm(),
                SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
