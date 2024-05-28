import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/product_model.dart';

class ProductData extends StatelessWidget {
  const ProductData({super.key, required this.product});
  final Products product;

  String capitalizeEachWord(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                capitalizeEachWord(product.title),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: 48,
                decoration: BoxDecoration(
                  color: product.isFavourite!
                      ? const Color(0xFFFFE6E6)
                      : const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SvgPicture.asset(
                  "assets/icons/Heart Icon_2.svg",
                  colorFilter: ColorFilter.mode(
                      product.isFavourite!
                          ? const Color(0xFFFF4848)
                          : const Color(0xFFDBDEE4),
                      BlendMode.srcIn),
                  height: 16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
            // right: 64,
          ),
          child: Column(
            children: [
              Text("Rs. ${product.price.toInt()}",
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
