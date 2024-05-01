import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/Features/Users/Customer/customer_notifier.dart';
import 'package:fyp/Features/Users/Seller/seller_notifier.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Models/customer_model.dart';
import 'package:fyp/Models/seller_model.dart';
import 'package:fyp/Models/user_model.dart';
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
          .set({'email': email, 'userType': userType});
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
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ProviderWidgets.showFlutterToast(context, "Error:${e.message}");
      }
    }
  }

  // Future<String> loginUser(
  //     {required String email,
  //     required String password,
  //     required BuildContext context}) async {
  //   try {
  //     ProviderWidgets.showLoadingDialog(context);
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     DocumentSnapshot<Map<String, dynamic>> user = await _firestore
  //         .collection('users')
  //         .doc(userCredential.user!.uid)
  //         .get();
  //     if (user.exists) {
  //       Map<String, dynamic> userData = user.data()!;
  //       SharedPreferences sharedPreferences =
  //           await SharedPreferences.getInstance();
  //       sharedPreferences.setString('email', userData['email']);
  //       sharedPreferences.setString('userType', userData['userType']);
  //       sharedPreferences.setBool('isLoggedIn', true);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     ProviderWidgets.showFlutterToast(context, e.message!);
  //   }
  // }
}
