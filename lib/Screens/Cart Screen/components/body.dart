// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Screens/Cart%20Screen/models/Cart.dart';

import 'cart_item_card.dart';

class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Dismissible(
              key: Key(demoCarts[index].product.id.toString()),
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
              child: CartitemCard(
                cart: demoCarts[index],
              )),
        ),
      ),
    );
  }
}
