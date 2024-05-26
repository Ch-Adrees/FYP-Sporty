// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/Cart%20Screen/components/cart_item_card.dart';
import 'package:fyp/Screens/OrderCheckout/modals/shipping_address.dart';
import '../../Models/cart_item.dart';
import '../../Models/product_model.dart';
import '../DetailProduct/Components/selected_detailed_product.dart';
import 'components/body.dart';
import 'models/Cart.dart';

class MyCartScreen extends StatelessWidget {
  static String routeName = "/mycartscreen";

  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SelectedCartProduct cartProduct =
    ModalRoute.of(context)!.settings.arguments as SelectedCartProduct;
    final List<CartItems> cartProducts = cartProduct.cartProduct;
    return Scaffold(
      appBar: buildAppBar(context),
      body: MyBody(cartProduct: cartProducts),
      bottomNavigationBar: const CheckOutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Your Cart",
          style: TextStyle(
            fontSize: 26.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          )),
      centerTitle: true,
    );
  }
}

// class MyBody extends StatelessWidget {
//   const MyBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: demoCarts.length,
//       itemBuilder: (context, index) => CartItemCard(cart: demoCarts[index]),
//     );
//   }
// }

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.3),
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(30),
        //   topRight: Radius.circular(30),
        // ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.receipt),
                ),
                const Spacer(),
                const Text("Add Voucher Code"),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$${calculateTotal(demoCarts)}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ShippingAndPaymentScreen.routeName);
                    },
                    child: const Text("Check Out"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  double calculateTotal(List<Cart> carts) {
    double total = 0;
    for (var cart in carts) {
      total += cart.product.price * cart.numOfItems;
    }
    return total;
  }
}
