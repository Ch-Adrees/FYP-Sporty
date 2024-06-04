import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/provi_wid.dart';
import '../../Models/order_model.dart';

class SellerOrder extends StateNotifier<List<OrderModel>> {
  SellerOrder() : super([]);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> newOrder(OrderModel order, BuildContext context) async {
    try {
      await firestore
          .collection('sellers')
          .doc(order.orderedItems[0].product.sellerId)
          .collection('orders')
          .add(order.orderToMap());
      ProviderWidgets.showFlutterToast(context, "Order Placed");
    } catch (e) {
      ProviderWidgets.showFlutterToast(context, "Error ${e.toString()}");
    }
  }

  Future<int?> getTotalNumberOfOrdersOfSeller(
      String sellerId, BuildContext context) async {
    await fetchTheTotalOrdersFromTheFirebase(sellerId, context);
    if (state.isNotEmpty) {
      return state.length;
    } else {
      return 0;
    }
  }

  Future<void> acceptOrder(
      int orderNumber, String sellerId, BuildContext context) async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('sellers')
          .doc(sellerId)
          .collection('orders')
          .where('orderNo', isEqualTo: orderNumber)
          .get();
      if (snapshot.docs.isNotEmpty) {
        for (DocumentSnapshot documentSnapshot in snapshot.docs) {
          documentSnapshot.reference.update({'isAccepted': true});
        }
        ProviderWidgets.showFlutterToast(context, "Order Accepted");
      } else {
        debugPrint("List is Empty");
      }
    } catch (e) {
      ProviderWidgets.showFlutterToast(context, "Error: ${e.toString()}");
    }
  }
  Future<void> rejectOrder(
      int orderNumber, String sellerId, BuildContext context) async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('sellers')
          .doc(sellerId)
          .collection('orders')
          .where('orderNo', isEqualTo: orderNumber)
          .get();
      if (snapshot.docs.isNotEmpty) {
        for (DocumentSnapshot documentSnapshot in snapshot.docs) {
          documentSnapshot.reference.update({'isRejected': true});
        }
        ProviderWidgets.showFlutterToast(context, "Order Accepted");
      } else {
        debugPrint("List is Empty");
      }
    } catch (e) {
      ProviderWidgets.showFlutterToast(context, "Error: ${e.toString()}");
    }
  }

  Future<void> fetchTheTotalOrdersFromTheFirebase(
      String sellerId, BuildContext context) async {
    List<OrderModel> orders = [];
    try {
      QuerySnapshot snapshot = await firestore
          .collection('sellers')
          .doc(sellerId)
          .collection('orders')
          .where('isAccepted', isEqualTo: false)
          .where('isRejected', isEqualTo: false)
          .get();
      for (var document in snapshot.docs) {
        orders
            .add(OrderModel.fromJson(document.data() as Map<String, dynamic>));
      }
      state = orders;
    } catch (e) {
      ProviderWidgets.showFlutterToast(context, "Error :${e.toString()}");
    }
  }
}
