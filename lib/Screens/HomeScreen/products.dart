import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen/section_title.dart';
import 'package:fyp/Screens/HomeScreen/demoproducts.dart';
import 'package:fyp/Screens/HomeScreen/productcard.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SectionTitle(
          title: "Products",
          press: () {
            //Navigator.pushNamed(context, ProductsScreen.routeName);
          },
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(demoProducts.length, (index) {
              if (demoProducts[index].isPopular) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ProductCard(
                    product: demoProducts[index],
                    onPress: () {},
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
