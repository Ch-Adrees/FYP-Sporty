import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/Screens/DetailProduct/Components/product_colors.dart';
import 'package:fyp/Screens/DetailProduct/Components/product_data.dart';
import 'package:fyp/Screens/DetailProduct/Components/rounded_containers.dart';
import 'Components/product_image.dart';
import 'Components/selected_detailed_product.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({super.key});
  static String routeName = "/details";

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  @override
  Widget build(BuildContext context) {
    final SelectedDetailedProduct selectedProduct =
    ModalRoute.of(context)!.settings.arguments! as SelectedDetailedProduct;
    final product = selectedProduct.product;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text(
                      '4.7',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset("assets/icons/Star Icon.svg"),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          ProductImage(
            prod: product,
          ),
          RoundedEdgeContainers(
            color: Colors.white,
            child: Column(
              children: [
                ProductData(product: product),
                RoundedEdgeContainers(
                    color: const Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        ProductColors(product: product),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RoundedEdgeContainers(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: const Text("Add To Cart"),
            ),
          ),
        ),
      ),
    );
  }
}
