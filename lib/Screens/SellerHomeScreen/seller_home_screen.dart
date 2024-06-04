import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/seller_model.dart';
import 'package:fyp/Screens/HomeScreen/icon_with_count.dart';
import 'package:fyp/Screens/SellerHomeScreen/detail_banner.dart';
import 'package:fyp/Screens/HomeScreen/section_title.dart';
import 'package:fyp/Screens/SellerHomeScreen/new_order_screen.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_all_product_screen.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_product_card.dart';

import 'package:fyp/Screens/UploadProductsScreen/upload_products_screen.dart';
import 'package:fyp/Screens/UserProfile/components/profile_screen.dart';
import '../../Models/product_model.dart';

class SellerHomeScreen extends ConsumerStatefulWidget {
  const SellerHomeScreen({super.key, required this.seller});
  static String routeName = "/seller_home_screen";
  final SellerModel seller;

  @override
  ConsumerState<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends ConsumerState<SellerHomeScreen> {
  int count = 1;
  List<Products> ownProdcts = [];
  void counterValue() async {
    String sellerId = await ref.read(authServicesProvider).getUserId();
    int? counted = await ref
        .read(sellerOrderProvider.notifier)
        .getTotalNumberOfOrdersOfSeller(sellerId, context);
    setState(() {
      count = counted!;
    });
  }

  void getOwnProducts() async {
    List<Products> tempProducts =
        await ref.read(productProvider.notifier).getOwnProduct(context);
    setState(() {
      ownProdcts = tempProducts;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    getOwnProducts();
    counterValue();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
            child: IconWithCount(
                svgicon: "assets/icons/Cart Icon.svg",
                count: count,
                press: () {
                  Navigator.pushNamed(context, NewOrderScreen.routeName);
                }),
          )
        ],
        title: const Text(
          'Seller',
          style: TextStyle(
            fontSize: 26.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            children: [
              DetailBanner(
                name: widget.seller.nameOfUser,
                shopName: widget.seller.shopName,
                profilePicture: widget.seller.profilePic,
              ),
              const SizedBox(height: 20),
              SectionTitle(
                  title: "Products",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SellerAllProducts(products: ownProdcts);
                    }));
                  }),
              const SizedBox(height: 5),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ownProdcts.length < 5 ? ownProdcts.length : 5,
                  itemBuilder: (context, index) {
                    return SellerProductCard(product: ownProdcts[index]);
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(alignment: Alignment.center, children: [
        BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/speaker-icon.svg",
                      height: 25,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const UploadProducts();
                      }));
                    },
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const NewOrderScreen();
                      }));
                    },
                    icon: const Icon(Icons.shopping_cart_checkout),
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfileScreen(
                          name: widget.seller.nameOfUser,
                          email: widget.seller.username,
                          profilePicture: widget.seller.profilePic,
                        );
                      }));
                    },
                    icon: const Icon(Icons.person_3),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
