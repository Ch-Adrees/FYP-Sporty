import 'package:flutter/material.dart';
import 'package:fyp/Models/cart_model.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({
    super.key,
    required this.cartedItem
  });
  final CartModel cartedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: SizedBox(
                height: 60,
                width: 60,
                child: Image.network(
                  cartedItem.product.images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Column(
              children: [
                const Text("Item Quantity:"),
               const  SizedBox(
                  height: 5,
                ),
                Text(cartedItem.quantity.toString()),
              ],
            ),
             Column(
              children: [
                const Text("Item Name:"),
                const SizedBox(
                  height: 5,
                ),
                Text(cartedItem.product.title),
              ],
            ),
             Column(
              children: [
                const Text("Item Price"),
                const SizedBox(
                  height: 5,
                ),
                Text(cartedItem.product.price.toString()),
              ],
            ),
          ],
        ),
        Divider(
          color: kDefaultIconDarkColor.withOpacity(0.6),
          height: 10,
          thickness: 2,
        )
      ],
    );
  }
}
