import 'package:flutter/material.dart';

import '../../HelperMaterial/constant.dart';
import '../../Models/product_model.dart';

class SellerAllProducts extends StatelessWidget {
  Widget buildcard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: kDefaultIconLightColor.withOpacity(0.6),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Product Title",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFCC5656),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kSecondaryColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Accept",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Reject",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius as needed
                    border: Border.all(
                      color: kTextColor.withOpacity(0.4),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/hanan.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Item Price:",
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          maxLines: 4,
                          "Muhammad Hanan Haider is a good boy. He do not work in flutter , he dont know How to play a crucial card."),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ]),
        ),
      ),
    );
  }

  static String routeName = "/seller_all_products";

  final List<Products> products;
  const SellerAllProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return buildcard();
            }),
      ),
    );
  }
}
