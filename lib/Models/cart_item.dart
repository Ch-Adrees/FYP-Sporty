import 'package:fyp/Models/product_model.dart';

class CartItems {
  Products cartItems;
 final  int quantity;
  CartItems({
    required this.cartItems,
     this.quantity=1,
  });
}
