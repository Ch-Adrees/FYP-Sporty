import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Models/customer_model.dart';

class CustomerNotifier extends StateNotifier<CustomerModel> {
  CustomerNotifier()
      : super(CustomerModel(
            nameOfUser: "",
            phoneNumber: "",
            address: "",
            profilePic: "",
            userId: "",
            username: ""));

  Future<void> createCustomer(CustomerModel customer,
      FirebaseFirestore firestore, BuildContext context) async {
    try {
      state = customer;
      await firestore
          .collection('customers')
          .doc(state.userId)
          .set(state.userToMap());
    } on FirebaseException catch (e) {
      if (context.mounted) {
        ProviderWidgets.showToast(context, "Error:${e.message}");
      }
    }
  }
}
