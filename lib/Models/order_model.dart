import 'package:fyp/Models/cart_item.dart';
import 'package:fyp/Models/customer_model.dart';

class OrderModel {
  final int orderNo;
  final DateTime orderDateTime;
  CustomerModel customerModel;
  final String sellerId;
  final String isDeleted;
  final String isAccepted;
  final List<CartItems> orderedItems;
  OrderModel(
      {required this.orderNo,
      required this.orderDateTime,
      required this.customerModel,
      required this.sellerId,
      required this.isDeleted,
      required this.isAccepted,
      required this.orderedItems});
}

List<OrderModel> orders = [];

List<CartItems> orderItems = [];