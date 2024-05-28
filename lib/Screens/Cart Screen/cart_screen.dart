import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/OrderCheckout/modals/shipping_address.dart';
import 'components/body.dart';
import 'models/Cart.dart';

class MyCartScreen extends ConsumerWidget {
  static String routeName = "/mycartscreen";
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var list = ref.watch(cartProvider);
   // final list = ModalRoute.of(context)!.settings.arguments as List<CartModel>;
    return Scaffold(
      appBar: buildAppBar(context),
      body: MyBody(cartedProductList: list),
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
                        text: "\$${calculateTotal(demoCarts).ceilToDouble()}",
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
