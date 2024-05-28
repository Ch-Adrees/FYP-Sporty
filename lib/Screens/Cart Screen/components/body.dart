import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Models/cart_model.dart';
import 'cart_item_card.dart';

class MyBody extends StatefulWidget {
  const MyBody({required this.cartedProductList, super.key});
  final List<CartModel> cartedProductList;

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: widget.cartedProductList.length,
        itemBuilder: (context, index) => Padding(
          padding:const EdgeInsets.symmetric(vertical: 2.0),
          child: Dismissible(
              key: Key(widget.cartedProductList[index].toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color:const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(children: [
                 const Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ]),
              ),
              onDismissed: (direction) {
                setState(() {
                  widget.cartedProductList.removeAt(index);
                });
              },
              child: CartItemCard(
                cartProduct: widget.cartedProductList[index],
              )),
        ),
      ),
    );
  }
}
