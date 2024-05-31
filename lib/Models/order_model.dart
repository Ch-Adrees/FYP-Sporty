import 'package:fyp/Models/cart_model.dart';

import 'package:fyp/Models/customer_model.dart';

class OrderModel {
  final int orderNo;
  final DateTime orderDateTime;
  CustomerModel customerModel;
  final bool isRejected;
  final bool isAccepted;
  final List<CartModel> orderedItems;
  OrderModel(
      {required this.orderNo,
      required this.orderDateTime,
      required this.customerModel,
      required this.isRejected,
      required this.isAccepted,
      required this.orderedItems});

  Map<String, dynamic> orderToMap() {
    return {
      'orderNo': orderNo,
      'orderDateTime': orderDateTime.toIso8601String(),
      'customerModel': customerModel.userToMap(),
      'isRejected': isRejected,
      'isAccepted': isAccepted,
      'orderedItems': orderedItems.map((item) => item.toJson()).toList()
    };
  }
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderNo: json['orderNo'],
      orderDateTime: DateTime.parse(json['orderDateTime']),
      customerModel: CustomerModel.fromMap(json['customerModel']), // Assuming CustomerModel has a fromJson method
      isRejected: json['isRejected'],
      isAccepted: json['isAccepted'],
      orderedItems: List<CartModel>.from(
        json['orderedItems'].map((item) => CartModel.fromJson(item))
      ) // Assuming CartModel has a fromJson method
    );
  }
}

List<OrderModel> orders = [];
