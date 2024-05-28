import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/cart_model.dart';
import 'package:fyp/Screens/DetailProduct/Components/product_data.dart';
import 'package:fyp/Screens/DetailProduct/Components/product_quantity.dart';
import 'package:fyp/Screens/DetailProduct/Components/rounded_containers.dart';
import 'package:fyp/Screens/MycartScreen/mycart_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Components/product_image.dart';
import 'Components/rating_service.dart';
import 'Components/selected_detailed_product.dart';

class SingleProductScreen extends ConsumerStatefulWidget {
  const SingleProductScreen({super.key});

  static String routeName = "/details";

  @override
  ConsumerState<SingleProductScreen> createState() =>
      _SingleProductScreenState();
}

class _SingleProductScreenState extends ConsumerState<SingleProductScreen> {
  int productQuantity = 0;
  double currentRating = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserRating();
  }

  void submitRating(int productId, double rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? storedRating = prefs.getDouble('rating_$productId');
    if (storedRating == null) {
      RatingService ratingService = RatingService();
      try {
        await ratingService.addRating(productId, rating);
        ProviderWidgets.showFlutterToast(context, 'Rating Updated');
      } catch (e) {
        ProviderWidgets.showFlutterToast(
            context, 'Error in Updating Rating: $e');
      }
    }
    await prefs.setDouble('rating_$productId', rating);
    setState(() {
      currentRating = rating;
    });
  }

  void _loadUserRating() async {
    final SelectedDetailedProduct selectedProduct =
        ModalRoute.of(context)!.settings.arguments as SelectedDetailedProduct;
    final product = selectedProduct.product;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? rating = prefs.getDouble('rating_${product.productId}');
    if (rating != null) {
      setState(() {
        currentRating = rating;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProductQuantity(product: product),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RatingBar.builder(
                          initialRating: currentRating,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 35,
                          tapOnlyMode: true,
                          onRatingUpdate: (rating) {
                            setState(() {
                              ProviderWidgets.showFlutterToast(
                                  context, "Rating already Given");
                            });
                            submitRating(product.productId, rating);
                          },
                        ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartScreenNew();
                }));
              },
              child: const Text("Add To Cart"),
            ),
          ),
        ),
      ),
    );
  }

  void addItemTCart(CartModel cartItem, BuildContext context) {
    ref.read(cartProvider.notifier).addItemToCart(cartItem, context);
  }
}
