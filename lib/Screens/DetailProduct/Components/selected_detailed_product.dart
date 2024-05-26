import 'package:fyp/Models/product_model.dart';

import '../../../Models/cart_item.dart';

class SelectedDetailedProduct{
  final Products product;
  const SelectedDetailedProduct({required this.product});
}

class SelectedCartProduct{
  final List<CartItems> cartProduct;
  const SelectedCartProduct({required this.cartProduct});
}
