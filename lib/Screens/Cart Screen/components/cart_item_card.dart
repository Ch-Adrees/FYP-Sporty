

import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/cart.dart';



class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key, required this.cartProduct,
  });
final CartModel cartProduct;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(padding:const EdgeInsets.all(5),
        child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
              child: Image.asset(cartProduct.product.images[0]),
              ),
            ),
          ),
         const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               cartProduct.product.title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(
                text: "\$${cartProduct.product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                    
              ))
            ],
          )
        ],
      ),),
    );
  }
}
