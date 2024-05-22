import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/HomeScreen/icon_with_count.dart';
import 'package:fyp/Screens/SellerHomeScreen/detail_banner.dart';
import 'package:fyp/Screens/HomeScreen/section_title.dart';
import 'package:fyp/Screens/SellerHomeScreen/new_order_screen.dart';
import 'package:fyp/Screens/UploadProductsScreen/upload_products_screen.dart';
import 'package:fyp/Screens/AllProducts/products_page.dart';

import '../../Models/product_model.dart';

class SellerHomeScreen extends ConsumerStatefulWidget {
  const SellerHomeScreen({super.key});
  static String routeName = "/seller_home_screen";

  @override
  ConsumerState<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends ConsumerState<SellerHomeScreen> {
  int count = 1;
  List<Products> ownProdcts = [];

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
    getOwnProducts();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
          reverse: true,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            children: [
              DetailBanner(),
              const SizedBox(height: 20),
              SectionTitle(
                  title: "Products",
                  press: () {
                    Navigator.pushNamed(context, ProductPage.routeName);
                  }),
              const SizedBox(height: 5),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: ownProdcts.length,
                  itemBuilder: (context, index) {
                    return const Text("Hanan Bhutta");
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
                      Navigator.pushReplacement(context,
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const NewOrderScreen();
                      }));
                    },
                    icon: const Icon(Icons.shopping_cart_checkout),
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
