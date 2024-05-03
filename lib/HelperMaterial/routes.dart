// ignore_for_file: avoid_web_libraries_in_flutter, unused_import

import 'package:flutter/material.dart';
import 'package:fyp/Screens/Cart%20Screen/cart_screen.dart';
import 'package:fyp/Screens/MyAdsScreen/myads.dart';
import 'package:fyp/Screens/MyOrder/myorderscreen.dart';
import 'package:fyp/Screens/OrderCheckout/checkout.dart';
import 'package:fyp/Screens/OrderCheckout/modals/shipping_address.dart';
import 'package:fyp/Screens/Success%20Screen/success_screen.dart';
//import 'package:fyp/Screens/UserProfile/components/profile_screen.dart';
import 'package:fyp/Screens/UserProfile/edit_profile_screen.dart';
import 'package:fyp/Screens/WalletScreen/mywallet.dart';
import 'package:fyp/Screens/onBoardingScreen/onboardscreen.dart';
import 'package:fyp/Screens/SignInScreen/sigin.dart';
import 'package:fyp/Screens/SignupScreen/signup.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
import 'package:fyp/Screens/ForgetPassword/forget_password_screen.dart';
import 'package:fyp/Screens/OTPScreen/otp_screen.dart';
import 'package:fyp/Screens/HomeScreen/navigation_bar.dart';
import 'package:fyp/Screens/CompleteProfile/complete_profile_screen.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_home_screen.dart';
import 'package:fyp/Screens/UploadProductsScreen/upload_products_screen.dart';
import 'package:fyp/Screens/AllProducts/products_page.dart';
import 'package:fyp/Screens/AdminPanel/admin.dart';
import 'package:fyp/Screens/DetailProduct/detailed_product.dart';
import 'package:fyp/Screens/CategoryScreen/catagory_screen.dart';

final Map<String, WidgetBuilder> listOfRoutes = {
  NavBarScreen.routeName: (context) => const NavBarScreen(),
  OnBoardScreen.routeName: (context) => const OnBoardScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgetPassScreen.routeName: (context) => const ForgetPassScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  CompleteProfile.routeName: (context) => const CompleteProfile(),
  SellerHomeScreen.routeName: (context) => const SellerHomeScreen(),
  UploadProducts.routeName: (context) => const UploadProducts(),
  ProductPage.routeName: (context) => const ProductPage(),
  AdminPage.routeName: (context) => const AdminPage(),
  // ProfileScreen.routeName:(context) =>  ProfileScreen(name: 'ali',email: 'abc@gmail.com',),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  WalletScreen.routeName: (context) => const WalletScreen(),
  SingleProductScreen.routeName: (context) => const SingleProductScreen(),
  CategoryScreen.routeName: (context) => const CategoryScreen(),
  MyCartScreen.routeName: (context) => const MyCartScreen(),
  ShippingAndPaymentScreen.routeName: (context) =>
      const ShippingAndPaymentScreen(),
  CheckoutScreen.routeName: (context) => const CheckoutScreen(
        fullName: '',
        mobileNumber: '',
        address: '',
        city: '',
        state: '',
        country: '',
        selectedPaymentMethodName: '',
        selectedPaymentMethodImage: '',
        products: [],
      ),
  SuccessScreen.routeName: (context) => const SuccessScreen(),
  MyOrder.routeName: (context) => const MyOrder(),
  MyAdsScreen.routeName: (context) => const MyAdsScreen(),
};
