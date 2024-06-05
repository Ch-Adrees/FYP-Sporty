import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_product_edit_screen.dart';

import '../../Models/product_model.dart';

class SellerProductCard extends ConsumerWidget {
  const SellerProductCard({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      product.title,
                      softWrap: true,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 15,
                          overflow: TextOverflow.clip,
                          color: kTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EditProductScreen(
                              productCode: product.productCode,
                            );
                          }));
                        },
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await ref.read(productProvider.notifier).updateProductData(
                              context,
                              null,
                              null,
                              null,
                              null,
                              null,
                              true,
                              product.productCode);
                        },
                        color: kPrimaryColor,
                      ),
                    ),
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
                Image.network(
                  product.images[0],
                  fit: BoxFit.fill,
                  height: 120,
                  width: 100,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Price:",
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            " ${product.price} PKR",
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Description:",
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              maxLines: 4,
                              " ${product.description} ",
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
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
}
