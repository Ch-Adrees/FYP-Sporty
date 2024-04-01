import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/AllProducts/Parts/search_bar.dart';
import 'package:fyp/Screens/AllProducts/Parts/all_products.dart';

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
      body:const  SafeArea(
        child: Column(children: [
          ProductSearchBar(),
          SizedBox(height: 5),
          AllProducts(),
        ]),
      ),
    );
  }
}
