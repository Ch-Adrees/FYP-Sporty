import 'package:fyp/Models/cart_model.dart';
import 'package:fyp/Models/product_model.dart';

class SelectedDetailedProduct{
  final Products product;
  const SelectedDetailedProduct({required this.product});
}

class SelectedCartProduct{
  final List<CartModel> cartProduct;
  const SelectedCartProduct({required this.cartProduct});
}
