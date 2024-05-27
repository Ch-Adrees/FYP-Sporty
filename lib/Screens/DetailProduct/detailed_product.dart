import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/cart.dart';
import 'package:fyp/Screens/DetailProduct/Components/product_data.dart';
import 'package:fyp/Screens/DetailProduct/Components/rounded_containers.dart';
import '../Cart Screen/cart_screen.dart';
import 'Components/product_color_circle.dart';
import 'Components/product_image.dart';
import 'Components/selected_detailed_product.dart';

class SingleProductScreen extends ConsumerStatefulWidget {
  const SingleProductScreen({super.key});

  static String routeName = "/details";

  @override
  ConsumerState<SingleProductScreen> createState() =>
      _SingleProductScreenState();
}

class _SingleProductScreenState extends ConsumerState<SingleProductScreen> {
  void addItemTCart(CartModel cartItem, BuildContext context) {
    ref.read(cartProvider.notifier).addItemToCart(cartItem, context);
  }

  @override
  Widget build(BuildContext context) {
    int productQuantity = 1;
    final SelectedDetailedProduct selectedProduct =
        ModalRoute.of(context)!.settings.arguments as SelectedDetailedProduct;
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
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(
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
            //color: Colors.white,
            color: kSecondaryColor.withOpacity(0.1),
            child: Column(
              children: [
                ProductData(product: product),
                RoundedEdgeContainers(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          product.description,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RoundedIconBtn(
                            icon: Icons.remove,
                            press: () {
                              setState(
                                () {
                                  if (productQuantity > 0) {
                                    productQuantity--;
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor),
                              //borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              productQuantity.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(width: 10),
                          RoundedIconBtn(
                              icon: Icons.add,
                              press: () {
                                setState(() {
                                  productQuantity++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                //ProductColors(product: product)),
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
                CartModel cartItem =
                    CartModel(product: product, quantity: productQuantity);
                addItemTCart(cartItem, context);
                var list = ref.read(cartProvider);
                // ProviderWidgets.showFlutterToast(context, "Added Successfully");
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return  MyCartScreen(listofCartedtems: list);
                }));
              },
              child: const Text("Add To Cart"),
            ),
          ),
        ),
      ),
    );
  }
}
