import 'package:flutter/material.dart';
import 'package:fyp/Screens/EditProfile/components/profile_screen.dart';
import 'package:fyp/Screens/EditProfile/edit_profile_screen.dart';
import 'package:fyp/Screens/WalletScreen/mywallet.dart';
import 'package:fyp/Screens/onBoardingScreen/onboardscreen.dart';
import 'package:fyp/Screens/SignInScreen/sigin.dart';
import 'package:fyp/Screens/SignupScreen/signup.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
import 'package:fyp/Screens/ForgetPassword/forget_password_screen.dart';
import 'package:fyp/Screens/OTPScreen/otp_screen.dart';
import 'package:fyp/Screens/navigation_bar.dart';
import 'package:fyp/Screens/CompleteProfile/complete_profile_screen.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_home_screen.dart';
import 'package:fyp/Screens/UploadAdsScreen/upload_ads_screen.dart';
import 'package:fyp/Screens/AllProducts/products_page.dart';
import 'package:fyp/Screens/AdminPanel/admin.dart';




final Map<String,WidgetBuilder> listOfRoutes={
  NavBarScreen.routeName: (context) => const NavBarScreen(),
  OnBoardScreen.routeName:(context)=>const OnBoardScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgetPassScreen.routeName: (context) => const ForgetPassScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  CompleteProfile.routeName: (context) => const CompleteProfile(),
  SellerHomeScreen.routeName: (context) => const SellerHomeScreen(),
  UploadAds.routeName: (context) => const UploadAds(),
  ProductPage.routeName: (context) => const ProductPage(),
  AdminPage.routeName: (context) => const AdminPage(),
  ProfileScreen.routeName:(context) =>  ProfileScreen(),
  EditProfileScreen.routeName:(context) => EditProfileScreen(),
  WalletScreen.routeName:(context) => WalletScreen(),


};
