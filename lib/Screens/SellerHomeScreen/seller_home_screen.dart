import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/SellerHomeScreen/detail_banner.dart';
import 'package:fyp/Screens/HomeScreen/section_title.dart';
import 'package:fyp/Screens/UploadProductsScreen/upload_products_screen.dart';
import 'package:fyp/Screens/AllProducts/Parts/all_products.dart';
import 'package:fyp/Screens/AllProducts/products_page.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({super.key});
  static String routeName = "/seller_home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seller',
          //textAlign: TextAlign.center,
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
              //const SizedBox(height: 10,),
              DetailBanner(),
              const SizedBox(height: 20),
              SectionTitle(title: "Products", press: () {
                Navigator.pushNamed(context, ProductPage.routeName);
              }),
              const SizedBox(height: 5),
             const  AllProducts(),

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
              Container(
                width: 60.0,
                height: 60.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
                child: IconButton(
                  onPressed: () {Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const UploadProducts();
                }));},
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
