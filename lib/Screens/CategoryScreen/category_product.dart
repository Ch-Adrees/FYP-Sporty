import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/AllProducts/Parts/search_bar.dart';
import '../../Models/product_model.dart';
import '../HomeScreen/productcard.dart';

class CategoryProductPage extends StatefulWidget {
  const CategoryProductPage({super.key, required this.categoryName, required this.searchQuery});
  static String routeName = "/all_product";
  final String categoryName;
  final String? searchQuery;

  @override
  State<CategoryProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<CategoryProductPage> {
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
        title: const Text(
          'Products',
          style: TextStyle(
            fontSize: 22.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const ProductSearchBar(),
            const SizedBox(height: 5),
            StreamBuilder<List<Products>>(
              stream: widget.searchQuery != null && widget.searchQuery!.isNotEmpty
                  ? searchProductsByName(widget.searchQuery!)
                  : getProductsByCategory(widget.categoryName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SizedBox(height: 50, child: Center(child: Text('No Product Found.')));
                }

                List<Products> prodList = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: prodList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 250,
                        mainAxisSpacing: 7),
                    itemBuilder: (context, index) {
                      Products product = prodList[index];
                      return ProductCard(product: product);

                    },
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}

Stream<List<Products>> getProductsByCategory(String categoryName) {
  return FirebaseFirestore.instance.collection('products')
      .where('productCategory', isEqualTo: categoryName)
      .snapshots().map(
          (snapshot) => snapshot.docs
          .map((doc) => Products.fromJson(doc.data()))
          .toList());
}

Stream<List<Products>> searchProductsByName(String searchQuery) {
  return FirebaseFirestore.instance.collection('products')
      .where('title', isGreaterThanOrEqualTo: searchQuery)
      .where('title', isLessThanOrEqualTo: '$searchQuery\uf8ff')
      .snapshots().map(
          (snapshot) => snapshot.docs
          .map((doc) => Products.fromJson(doc.data()))
          .toList());
}

