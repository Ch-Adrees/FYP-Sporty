import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/Models/cart_model.dart';

import '../../HelperMaterial/constant.dart';

class CartScreenNewBody extends ConsumerStatefulWidget {
  const CartScreenNewBody({super.key, required this.cartItem});

  final CartModel cartItem;

  @override
  ConsumerState<CartScreenNewBody> createState() => _CartScreenNewBodyState();
}

class _CartScreenNewBodyState extends ConsumerState<CartScreenNewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  widget.cartItem.product.images[0],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartItem.product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.cartItem.product.productCategory!,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "PKR: ${widget.cartItem.product.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
            right: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () async {
                      ref
                          .read(cartProvider.notifier)
                          .removeItemFromCart(widget.cartItem, context);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.remove, color: Colors.black)),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "1",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
