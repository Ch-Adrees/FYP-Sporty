import 'package:fyp/Models/product_model.dart';

class CartModel {
  final Products product;
  final int quantity;
  CartModel({required this.product, required this.quantity});

  Map<String, dynamic> toJson() {
    return {'product': product.toJson(), 'quantity': quantity};
  }

  factory CartModel.fromJson(Map<String, dynamic> map) {
    return CartModel(
        product: Products.fromJson(map['product']), quantity: map['quantity']);
  }
  CartModel copywith({int? quantity, Products? product}) {
    return CartModel(
        product: product ?? this.product, quantity: quantity ?? this.quantity);
  }
}
