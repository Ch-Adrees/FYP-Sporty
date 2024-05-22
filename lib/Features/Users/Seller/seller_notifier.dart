import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/provi_wid.dart';

import 'package:fyp/Models/seller_model.dart';

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
  

  
}
