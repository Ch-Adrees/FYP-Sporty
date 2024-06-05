import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_product_edit_form.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key,required this.productCode});
  static String routeName = "/upload_products";
  final int productCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Product',
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:  SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
              const  SizedBox(height: 16),
                EditProductsForm(productCode: productCode,),
               const SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
