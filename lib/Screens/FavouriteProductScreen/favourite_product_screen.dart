import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/Models/product_model.dart';

import '../../HelperMaterial/constant.dart';
import '../HomeScreen/productcard.dart';

class FavoriteProductsScreen extends ConsumerWidget {
  const FavoriteProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourites',
          style: TextStyle(
            fontSize: 26.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<String>(
        future: ref.read(authServicesProvider).getUserId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(
              color: kPrimaryColor,));
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('User not found'));
          }

          String userId = snapshot.data!;

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .collection('favourites')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No favourite products found'));
              }

              List<int> favoriteProductIds = snapshot.data!.docs
                  .map((doc) => doc['productId'])
                  .whereType<int>()
                  .toList();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: favoriteProductIds.length,
                itemBuilder: (context, index) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('products')
                        .where('productId', isEqualTo: favoriteProductIds[index])
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator(
                          color: kPrimaryColor,));
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('Product not found'));
                      }

                      Products product = Products.fromJson(snapshot.data!.docs[0].data() as Map<String, dynamic>);

                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7.0, right: 8.0),
                          child: ProductCard(product: product),
                        ),
                          );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

