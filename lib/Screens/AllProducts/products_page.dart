import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/AllProducts/Parts/search_bar.dart';
import 'package:fyp/Screens/HomeScreen/demoproducts.dart';

import '../HomeScreen/productcard.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  static String routeName = "/all_product";

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},

            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {},
        ),
        title: const Text(
          "Products ",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Mulish',
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          const ProductSearchBar(),
          const SizedBox(height: 5,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true, // Set shrinkWrap to true
                  itemCount: demoProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisExtent:235 ,
                      mainAxisSpacing: 10),
                  itemBuilder: (_, int index) =>ProductCard(
                      aspectRatio:1.2,product: demoProducts[index], onPress: (){})
                  ),
            ),
          ),
        ]),
      ),
    );
  }
}
