

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';

import '../../../Models/cart_item.dart';
import '../../../Models/product_model.dart';
import '../models/Cart.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key, required this.cartProduct,
  });
final CartItems cartProduct;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(padding: EdgeInsets.all(5),
        child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //color: Color(0xFFF5F6F9),
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
              child: Image.asset(cartProduct.cartItems.images[0]),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               cartProduct.cartItems.title,
                style: TextStyle(fontSize: 16, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                text: "\$${cartProduct.cartItems.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                    // children: [TextSpan(text: " x${cart.numOfItems}",
                    // style: TextStyle(color: kTextColor),
                    // )]
              ))
            ],
          )
        ],
      ),),
    );
  }
}
