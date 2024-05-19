import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/UploadProductsScreen/upload_products_form.dart';

import '../SellerHomeScreen/seller_home_screen.dart';

class UploadProducts extends StatelessWidget {
  const UploadProducts({super.key});
  static String routeName = "/upload_products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {Navigator.pushNamed(context, SellerHomeScreen.routeName);},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Upload Product',
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
                Text("Upload Product", style: headingStyle),
                Text(
                  "Showcase your business by uploading \nyour product and captivate your audience",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                UploadProductsForm(),
                SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
