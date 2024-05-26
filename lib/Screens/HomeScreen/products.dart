import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fyp/Screens/HomeScreen/section_title.dart';
import 'package:fyp/Models/product_model.dart';
import 'package:fyp/Screens/HomeScreen/productcard.dart';
import 'package:fyp/Screens/AllProducts/products_page.dart';
import '../../HelperMaterial/constant.dart';
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
      StreamBuilder<List<Products>>(
          stream: getProductsFromFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Product found.'));
            }

            List<Products> prodList = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: prodList
                    .map((product) => Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 8.0), // Adjust the space as needed
                  child: ProductCard(product: product),
                ))
                    .toList(),
              ),
            );
          },
        ),
    ]);
  }
}

Stream<List<Products>> getProductsFromFirebase() {
  return FirebaseFirestore.instance
      .collection('products')
      .limit(10)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Products.fromJson(doc.data() as Map<String, dynamic>)).toList());
}