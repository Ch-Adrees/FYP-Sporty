import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/cart_model.dart';
import 'package:fyp/Screens/MycartScreen/mycart_body.dart';
import 'package:fyp/Screens/payment/payment_options.dart';

class CartScreenNew extends ConsumerStatefulWidget {
  const CartScreenNew({super.key});
  static String routeName = "/cartScreen";
  @override
  ConsumerState<CartScreenNew> createState() => _CartScreenNewState();
}

class _CartScreenNewState extends ConsumerState<CartScreenNew> {
  late List<CartModel> list;

  double totalAmount = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list = ref.watch(cartProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cart Screen",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        bottomSheet: Container(
          height: 120,
          decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total :",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text(
                    ref.watch(cartProvider.notifier).totalAmount().toString(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () async {
                  // ref
                  //     .read(orderProvider.notifier)
                  //     .makeOrder(list, context, ref);
                  // ref
                  //     .read(orderProvider.notifier)
                  //     .loadAllTheOrderOfSellerFromFirebase(ref, context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return   PaymentOption(list: list,);
                  }));
                },
                style: ElevatedButton.styleFrom(elevation: 1),
                child: const Text("Checkout"),
              ),
            )
          ]),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) =>
                CartScreenNewBody(cartItem: list[index]),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
            itemCount: list.length));
  }
}
