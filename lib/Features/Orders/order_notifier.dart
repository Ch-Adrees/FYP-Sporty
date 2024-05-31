import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/Authentication/auth_service.dart';
import 'package:fyp/Features/Users/Customer/customer_notifier.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/Models/customer_model.dart';
import 'package:fyp/Models/order_model.dart';
import '../../Models/cart_model.dart';

class Order extends StateNotifier<List<OrderModel>> {
  Order(super._state);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CustomerNotifier customerNotifier = CustomerNotifier();
  AuthServices auth = AuthServices();

  Future<void> loadAllTheOrderOfSellerFromFirebase(String sellerId) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('sellers')
          .doc(sellerId)
          .collection('orders')
          .get();
      for (var document in querySnapshot.docs) {
        state.add(OrderModel.fromJson(document.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> makeOrderForSeller(
      OrderModel order, BuildContext context) async {
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

  Future<void> makeOrder(
      List<CartModel> list, BuildContext context, WidgetRef ref) async {
    List<CartModel> temporaryList = [];
    while (list.isNotEmpty) {
      var currentProduct = list[0];

      for (int i = 0; i < list.length; i++) {
        if (list[i].product.sellerId == currentProduct.product.sellerId) {
          temporaryList.add(list[i]);
        }
      }
    }
    CustomerModel? customerModel =
        await ref.read(customerProvider.notifier).getCustomerById(context);

    OrderModel sellerOrder = OrderModel(
        orderNo: 1,
        orderDateTime: DateTime.now(),
        customerModel: customerModel!,
        isRejected: false,
        isAccepted: false,
        orderedItems: temporaryList);
    await makeOrderForSeller(sellerOrder, context);
  }
}
