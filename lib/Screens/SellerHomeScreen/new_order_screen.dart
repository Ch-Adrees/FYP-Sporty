import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/SellerHomeScreen/order_card.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({super.key});
  static String routeName = "/new_orders";

  Widget itemslist() {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/hanan.jpg"),
          const Column(
            children: [
              Text("Item Name"),
              Text("Item Price"),
            ],
          ),
          const Text("Item Quantity"),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "New Orders",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const  Ordercard();
                }),
          ),
        ],
      ),
    );
  }
}
