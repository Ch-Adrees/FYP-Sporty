import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fyp/Screens/HomeScreen/section_title.dart';
import 'package:fyp/Models/product_model.dart';
import 'package:fyp/Screens/HomeScreen/productcard.dart';
import 'package:fyp/Screens/AllProducts/products_page.dart';
import '../DetailProduct/Components/selected_detailed_product.dart';
import '../DetailProduct/detailed_product.dart';




class Product extends ConsumerStatefulWidget {
  const Product({super.key});

  @override
  ConsumerState<Product> createState() => _ProductState();
}

class _ProductState extends ConsumerState<Product> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SectionTitle(
          title: "Products",
          press: () {
            Navigator.pushNamed(context, ProductPage.routeName);
          },
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(demoProducts.length, (index) {
              if (demoProducts[index].isPopular!) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ProductCard(
                    product: demoProducts[index],
                    onPress: () {
                      Navigator.pushNamed(
                        context,
                        SingleProductScreen.routeName,
                        arguments:SelectedDetailedProduct(product: demoProducts[index]),
                      );
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            }
            ),
            const SizedBox(width: 20,),
          ],
        ),
      ),
    ]);
  }
}