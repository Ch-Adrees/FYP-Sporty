import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen/section_title.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: SectionTitle(
    title: "Products",
    press: () {
    //Navigator.pushNamed(context, ProductsScreen.routeName);
    },
    ),
    ),
    ]
    );
  }
}
