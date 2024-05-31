
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Models/seller_model.dart';
import 'package:fyp/Screens/SignInScreen/sigin.dart';

class SellerNotifier extends StateNotifier<SellerModel> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  SellerNotifier()
      : super(SellerModel(
            shopName: "",
            shopAddress: "",
            nameOfUser: "",
            phoneNumber: "",
            address: "",
            profilePic: "",
            fcmToken: "",
            userId: "",
            username: ""));

  Future<void> createSeller(SellerModel seller, BuildContext context) async {
    try {
      state = seller;
      await firestore
          .collection('sellers')
          .doc(state.userId)
          .set(state.userToMap());
    } on FirebaseException catch (e) {
      if (context.mounted) {
        ProviderWidgets.showToast(context, "Error:${e.message}");
      }
    }
  }

  Future<void> completeProfileScreen(
    BuildContext context,
    String? profilePic,
    String? name,
    String? phoneNumber,
    String? shopName,
    String? shopAddress,
    String? address,
    WidgetRef ref,
    String userId,
  ) async {
    try {
      // String userId = await ref.read(authServicesProvider).getUserId();//this will be null after
      SellerModel? seller = await getSellerbyId(userId, context);
      SellerModel newSeller = seller!.copyWith(
          nameOfUser: name,
          phoneNumber: phoneNumber,
          shopName: shopName,
          address: address,
          profilePic: profilePic,
          shopAddress: shopAddress);
      await firestore
          .collection('sellers')
          .doc(seller.userId)
          .set(newSeller.userToMap());
      SetOptions(merge: true);
      ProviderWidgets.showFlutterToast(context, "Profile has been updated.");
      Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const SignInScreen();
            }));
    } catch (e) {
      ProviderWidgets.showFlutterToast(
          context, "Error in completing profile: ${e.toString()}");
    }
  }

  Future<SellerModel?> getSellerbyId(
      String userId, BuildContext context) async {
    try {
      DocumentSnapshot snapshot =
          await firestore.collection('sellers').doc(userId).get();
      if (snapshot.exists) {
        // Assuming only one document matches the query
        var data = snapshot.data() as Map<String, dynamic>;
        SellerModel seller = SellerModel.fromMap(data);
        return seller;
      } else {
        throw Exception("Seller does not exist");
      }
    } catch (e) {
      ProviderWidgets.showFlutterToast(
          context, "Error fethching the seller record ${e.toString()}");
      return null;
    }
  }
}
