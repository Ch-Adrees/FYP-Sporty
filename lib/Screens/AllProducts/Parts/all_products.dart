import 'package:flutter/material.dart';
import 'package:fyp/Models/product_model.dart';
import 'package:fyp/Screens/HomeScreen/productcard.dart';
import 'package:fyp/Screens/DetailProduct/Components/selected_detailed_product.dart';
import 'package:fyp/Screens/DetailProduct/detailed_product.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          shrinkWrap: true, // Set shrinkWrap 6to true
          itemCount: demoProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 235,
              mainAxisSpacing: 10),
          itemBuilder: (_, int index) => ProductCard(
              aspectRatio: 1.2,
              product: demoProducts[index],
              onPress: () {
                Navigator.pushNamed(
                  context,
                  SingleProductScreen.routeName,
                  arguments:
                      SelectedDetailedProduct(product: demoProducts[index]),
                );
              })),
    );
  }
}
