// ignore_for_file: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Screens/SignupScreen/signup.dart';
import 'Screens/MyAdsScreen/postform.dart';
import 'Screens/SellerHomeScreen/seller_home_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/app_themes.dart';
import 'Screens/CategoryScreen/catagory_screen.dart';
import 'Screens/onBoardingScreen/onboardscreen.dart';
import 'HelperMaterial/routes.dart';
import 'package:fyp/Screens/CompleteProfile/complete_profile_screen.dart';
import 'package:fyp/Screens/UploadProductsScreen/upload_products_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 runApp (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sporty App',
      theme: AppTheme.lightTheme(context),
      //home: const ProviderScope(child: SignUpScreen(),),
      // initialRoute: OnBoardScreen.routeName,
      // routes: listOfRoutes,
      home: const UploadProducts(),
      //home: PostAdScreen(),
    );
  }
}
