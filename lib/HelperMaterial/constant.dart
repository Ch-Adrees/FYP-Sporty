// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFE5370E);
const kPrimaryLightColor = Color(0xFFFFECDF);
final _gradientLighterColor = const Color(0xFFFF7643).withOpacity(0.7);
final _gradientbeforeLighterColor = Color(0xFFFFA53E).withOpacity(0.7);
final kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [_gradientbeforeLighterColor, _gradientLighterColor],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);
const List<String> imagesPath = ["assets/images/istockphoto-1355687160-1024x1024.jpg","assets/images/istockphoto-1355687160-1024x1024.jpg","assets/images/istockphoto-1355687160-1024x1024.jpg","assets/images/istockphoto-1355687160-1024x1024.jpg"];

const headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kShopNameNullError = "Please Enter your Shop Name";
const String kProductCodeNullError = "Please Enter Product Code";
const String kProductTitleNullError = "Please Enter Product Title";
const String kProductDescriptionNullError = "Please Enter Product Description";
const String kProductCategoryNullError = "Please Enter Product Category";
const String kProductQuantityNullError = "Please Enter Product Quantity";
const String kProductPriceNullError = "Please Enter Product Price";
const String kAdTitleNullError = "Please Enter Ad Title";
const String kAdVenueNullError = "Please Enter Ad Venue";
const String kAdDateNullError = "Please Enter Ad Date";
const String kAdFeeNullError = "Please Enter Ad Fee";
const String kAdOrganizerNameNullError = "Please Enter Ad's Organizer Name";
const String kAdPhoneNumberNullError = "Please Enter Phone Number";

List<Color> listOfColors = [
  Colors.blue.shade100,
  Colors.amber.shade200.withOpacity(0.5),
  Colors.orange.shade200.withOpacity(0.6),
  Colors.brown.shade200.withOpacity(0.8)
];

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: kTextColor),
  );
}
