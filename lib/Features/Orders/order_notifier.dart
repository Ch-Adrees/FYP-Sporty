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

  Future<void> makeOrder(
      List<CartModel> list, BuildContext context, WidgetRef ref) async {
    CustomerModel? customerModel =
        await ref.read(customerProvider.notifier).getCustomerById(context);

    List<CartModel> finalList = [];
    while (list.isNotEmpty) {
      List<CartModel> temporaryList = [];
      var currentProduct = list[0];
      for (int i = 0; i < list.length; i++) {
        if (list[i].product.sellerId == currentProduct.product.sellerId) {
          temporaryList.add(list[i]);
        }
      }
      for (int i = 0; i < temporaryList.length; i++) {
        list.remove(temporaryList[i]);
      }
      int? sellerOrderNumber = await ref
          .read(sellerOrderProvider.notifier)
          .getTotalNumberOfOrdersOfSeller(
              temporaryList[0].product.sellerId!, context);

      OrderModel sellerOrder = OrderModel(
          orderNo: sellerOrderNumber! + 1,
          orderDateTime: DateTime.now(),
          customerModel: customerModel!,
          isRejected: false,
          isAccepted: false,
          orderedItems: temporaryList);
      ref.read(sellerOrderProvider.notifier).newOrder(sellerOrder, context);

      finalList.addAll(temporaryList);
    }
    int? totalOrder = await getAllNumberOfDocumentsFromOrderCollection();
    OrderModel customerOrder = OrderModel(
        orderNo: totalOrder! + 1,
        orderDateTime: DateTime.now(),
        customerModel: customerModel!,
        isRejected: false,
        isAccepted: false,
        orderedItems: finalList);
    customerPlacedOrders(customerOrder, context);
  }

  Future<void> customerPlacedOrders(
      OrderModel order, BuildContext context) async {
    try {
      await firestore.collection('orders').add(order.orderToMap());
      ProviderWidgets.showFlutterToast(context, "This Order is also saved");
    } catch (e) {
      ProviderWidgets.showFlutterToast(context, "Error:${e.toString()}");
    }
  }

  Future<void> getAllTheOrdersfromOrderCollection() async {
    List<OrderModel> orders = [];
    try {
      QuerySnapshot snapshot = await firestore.collection('orders').get();

      for (var document in snapshot.docs) {
        orders
            .add(OrderModel.fromJson(document.data() as Map<String, dynamic>));
      }
      state = orders;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<int?> getAllNumberOfDocumentsFromOrderCollection() async {
    getAllTheOrdersfromOrderCollection();
    if (state.isNotEmpty) {
      return state.length;
    } else {
      return 0;
    }
  }
}
