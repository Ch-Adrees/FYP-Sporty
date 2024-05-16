import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/Authentication/auth_controller.dart';
import 'package:fyp/Features/Authentication/auth_service.dart';
import 'package:fyp/Features/Product/product_provider.dart';
import 'package:fyp/Features/Users/Customer/customer_notifier.dart';
import 'package:fyp/Features/Users/Seller/seller_notifier.dart';
import 'package:fyp/Models/customer_model.dart';
import 'package:fyp/Models/seller_model.dart';

import '../Models/product_model.dart';

// These provider will Work for the Authentication and Authorization
final authControllerProvider = StateProvider((ref) {
  final authRepo = ref.watch(authServicesProvider);
  return AuthenticationController(authRepo);
});

final authServicesProvider = StateProvider((ref) {
  return AuthServices();
});

// Here will be the Customer Provider
final customerProvider =
    StateNotifierProvider<CustomerNotifier, CustomerModel>((ref) {
  return CustomerNotifier();
});
// Implementtionof the Seller Provider
final sellerProvider =
    StateNotifierProvider<SellerNotifier, SellerModel>((ref) {
  return SellerNotifier();
});

final productProvider =
    StateNotifierProvider<ProductNotifier, List<Products>>((ref) {
  List<Products> prod = [];
  return ProductNotifier(prod);
});
