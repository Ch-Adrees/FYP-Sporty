import 'package:flutter/material.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_product_card.dart';
import '../../HelperMaterial/constant.dart';
import '../../Models/product_model.dart';

class SellerAllProducts extends StatelessWidget {
  final List<Products> products;
  const SellerAllProducts({super.key, required this.products});
  static String routeName = "/seller_all_products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return SellerProductCard(product: products[index]);
            }),
      ),
    );
  }
}
