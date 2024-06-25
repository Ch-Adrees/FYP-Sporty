import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fyp/Models/product_model.dart';
import 'package:fyp/Screens/HomeScreen/productcard.dart';

import '../../../HelperMaterial/constant.dart';

class AllProducts extends ConsumerWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: StreamBuilder<List<Products>>(
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
            return GridView.builder(
              shrinkWrap: true,
              itemCount: prodList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 240,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                Products product = prodList[index];
                return ProductCard(product: product);
              },
            );
          },
        ),
      ),
    );
  }
}

Stream<List<Products>> getProductsFromFirebase() {
  return FirebaseFirestore.instance.collection('products').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => Products.fromJson(doc.data())).toList());
}
