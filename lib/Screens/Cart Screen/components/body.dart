// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Models/cart_item.dart';
import 'package:fyp/Models/product_model.dart';
import 'package:fyp/Screens/Cart%20Screen/models/Cart.dart';

import 'cart_item_card.dart';

class MyBody extends StatefulWidget {
  const MyBody({required this.cartProduct, super.key});
  final List<CartItems> cartProduct;

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: widget.cartProduct.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0),
          child: Dismissible(
              key: Key(widget.cartProduct[index].toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ]),
              ),
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              child: CartItemCard(
                cartProduct: widget.cartProduct[index],
              )),
        ),
      ),
    );
  }
}
