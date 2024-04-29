import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/Features/Users/Customer/customer_notifier.dart';
import 'package:fyp/Features/Users/Seller/seller_notifier.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Models/customer_model.dart';
import 'package:fyp/Models/seller_model.dart';
import 'package:fyp/Models/user_model.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CustomerNotifier customerNotifier;
  late final UserModel user;
  final SellerNotifier sellerNotifier;
  AuthServices(this.sellerNotifier, this.customerNotifier);

  Future<void> registerUser(
      {required String email,
      required String password,
      required String userType,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        switch (userType) {
          case 'customer':
            {
              ProviderWidgets.showLoadingDialog(context);
              user = CustomerModel(
                  nameOfUser: "",
                  phoneNumber: "",
                  address: "",
                  profilePic: "",
                  userId: userCredential.user!.uid,
                  username: email);
              await customerNotifier.createCustomer(
                  user as CustomerModel, _firestore, context);
              if (context.mounted) {
                ProviderWidgets.showToast(
                    context, "Customer has Been Registered Successfuly");
              }
            }
            break;
          case 'seller':
            {
              ProviderWidgets.showLoadingDialog(context);
              user = SellerModel(
                  shopName: "",
                  shopAdress: "",
                  nameOfUser: "",
                  phoneNumber: "",
                  address: "",
                  profilePic: "",
                  userId: userCredential.user!.uid,
                  username: email);
              ProviderWidgets.showLoadingDialog(context);
              await sellerNotifier.createSeller(
                  user as SellerModel, _firestore, context);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
              if (context.mounted) {
                ProviderWidgets.showToast(
                    context, "Seller has Been Registered Successfuly");
              }
            }
            break;
          default:
            {
              ProviderWidgets.showToast(context, "Invalid User Type :");
            }
            break;
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ProviderWidgets.showLoadingDialog(context);
        ProviderWidgets.showToast(context, "Error:${e.message}");
      }
    } finally {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}
