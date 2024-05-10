import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Features/Users/Customer/customer_notifier.dart';
import 'package:fyp/Features/Users/Seller/seller_notifier.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Models/customer_model.dart';
import 'package:fyp/Models/seller_model.dart';
import 'package:fyp/Models/user_model.dart';
import 'package:fyp/Screens/HomeScreen/navigation_bar.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_home_screen.dart';
import 'package:fyp/Screens/SignInScreen/sigin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CustomerNotifier customerNotifier;

  final SellerNotifier sellerNotifier;
  AuthServices(this.sellerNotifier, this.customerNotifier);

  Future<void> registerUser(
      {required String email,
      required String password,
      required String userType,
      required BuildContext context}) async {
    try {
      if (context.mounted) ProviderWidgets.showLoadingDialog(context);
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({'email': email, 'userType': userType, 'isDeleted': false});
      if (context.mounted) {
        switch (userType) {
          case 'customer':
            {
              UserModel user = CustomerModel(
                  nameOfUser: "",
                  phoneNumber: "",
                  address: "",
                  profilePic: "",
                  userId: userCredential.user!.uid,
                  username: email);
              await customerNotifier.createCustomer(
                  user as CustomerModel, _firestore, context);
              if (context.mounted) {
                Navigator.of(context).pop();
                ProviderWidgets.showFlutterToast(
                    context, "Customer has Been Registered Successfuly");
              }
            }
            break;
          case 'seller':
            {
              UserModel user = SellerModel(
                  shopName: "",
                  shopAdress: "",
                  nameOfUser: "",
                  phoneNumber: "",
                  address: "",
                  profilePic: "",
                  userId: userCredential.user!.uid,
                  username: email);

              await sellerNotifier.createSeller(
                  user as SellerModel, _firestore, context);
              if (context.mounted) {
                Navigator.of(context).pop();
                ProviderWidgets.showFlutterToast(
                    context, "Seller has Been Registered Successfuly");
              }
            }
            break;
          default:
            {
              Navigator.of(context).pop();
              ProviderWidgets.showFlutterToast(context, "Invalid User Type :");
            }
            break;
        }
      } //is ki if k baad jo karn ha kro
      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const SignInScreen();
        }));
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ProviderWidgets.showFlutterToast(context, "Error:${e.message}");
      }
    }
  }

//Login function
  Future<String?> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    String? userType;
    try {
      ProviderWidgets.showLoadingDialog(context);
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      DocumentSnapshot<Map<String, dynamic>> user = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (user.exists) {
        Map<String, dynamic> userData = user.data()!;
        userType = userData['userType'];
        if (userType != null) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          if (context.mounted) {
            ProviderWidgets.showFlutterToast(context, userType);
          }
          sharedPreferences.setString('email', userData['email']);
          sharedPreferences.setString('userType', userType);
          sharedPreferences.setBool('isLoggedIn', true);
        }

        if (context.mounted) {
          Navigator.of(context).pop();
          if (userType != null) {
            switch (userType) {
              case 'customer':
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const NavBarScreen();
                }));
                break;
              case 'seller':
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const SellerHomeScreen();
                }));
                break;
              default:
                ProviderWidgets.showFlutterToast(
                    context, "Undefined user type");
            }
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ProviderWidgets.showFlutterToast(context, e.message!);
      }
    }
    return userType;
  }

  Future<void> chekUserLogedIn(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      bool? loginStatus = sharedPreferences.getBool('isLoggedIn')?? false ;
      String? userType =  sharedPreferences.getString('userType')!;
     if (loginStatus == false) {
        if (context.mounted) {
          ProviderWidgets.showFlutterToast(context, loginStatus.toString());
          Navigator.pushReplacementNamed(context, SignInScreen.routeName);
        }
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          if (context.mounted) {
            // ProviderWidgets.showFlutterToast(context, userType);
            switch (userType) {
              case 'customer':
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const NavBarScreen();
                }));
                break;
              case 'seller':
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const SellerHomeScreen();
                }));

                break;
            }
          }
        });
      }
    } on FirebaseException catch (e) {
      if (context.mounted) ProviderWidgets.showFlutterToast(context, e.message);
    }
  }
}
