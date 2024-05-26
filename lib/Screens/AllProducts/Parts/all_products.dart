import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fyp/Models/product_model.dart';
import 'package:fyp/Screens/HomeScreen/productcard.dart';


class AllProducts extends ConsumerWidget {
  const AllProducts({super.key});

@override
  Widget build(BuildContext context, WidgetRef ref){
    
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
              // onPress: () {
              //   Navigator.pushNamed(
              //     context,
              //     SingleProductScreen.routeName,
              //     arguments:
              //         SelectedDetailedProduct(product: demoProducts[index]),
              //   );
              // }
  )),
    );
  }
}

Stream<List<Products>> getProductsFromFirebase() {
  return FirebaseFirestore.instance
      .collection('products')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Products.fromJson(doc.data() as Map<String, dynamic>)).toList());
}
