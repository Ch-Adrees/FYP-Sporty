// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen/search_field.dart';
import 'package:fyp/Screens/HomeScreen/icon_with_count.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(
            width: 16,
          ),
          IconWithCount(
            svgicon: "assets/icons/Cart Icon.svg",
            count: 0, // add from the no of items in cart
            press:
                () { // Navigator.pushNamed(context, CartScreen.routeName),
               },
          ),
          const SizedBox(width: 8),
          IconWithCount(
              svgicon: "assets/icons/Bell.svg", count: 3, press: () {}),
        ],
      ),
    );
  }
}
