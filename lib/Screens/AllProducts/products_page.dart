// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/AllProducts/Parts/search_bar.dart';
import 'package:fyp/Screens/HomeScreen/demoproducts.dart';

import '../DetailProduct/Components/selected_detailed_product.dart';
import '../DetailProduct/detailed_product.dart';
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
        backgroundColor: const Color(0xFFF5F6F9),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        title: const Text('Products',style: TextStyle(
          fontSize:20,
          fontWeight: FontWeight.w600,
          color: kPrimaryColor,
        ),),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Column(children: [
          const ProductSearchBar(),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true, // Set shrinkWrap to true
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
                          arguments: SelectedDetailedProduct(
                              product: demoProducts[index]),
                        );
                      })),
            ),
          ),
        ]),
      ),
    );
  }
}
