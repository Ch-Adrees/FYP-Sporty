import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/product_model.dart';

import '../DetailProduct/Components/selected_detailed_product.dart';
import '../DetailProduct/detailed_product.dart';

class ProductCard extends ConsumerStatefulWidget {
  const ProductCard({
    Key? key,
    this.width = 150,
    this.aspectRatio = 1.0,
    required this.product,
    this.price,
  }) : super(key: key);

  final double width, aspectRatio;
  final Products product;
  final String? price;

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  bool isFavourite = false;
  String? favouriteDocId;

  @override
  void initState() {
    super.initState();
    _checkIfFavourite();
  }

  Future<void> _checkIfFavourite() async {
    String customerId = await ref.read(authServicesProvider).getUserId();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(customerId)
        .collection('favourites')
        .where('productId', isEqualTo: widget.product.productId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        isFavourite = true;
        favouriteDocId = querySnapshot.docs.first.id;
      });
    }
  }

  Future<void> toggleFavourite() async {
    String customerId = await ref.read(authServicesProvider).getUserId();
    CollectionReference favourites = FirebaseFirestore.instance
        .collection('users')
        .doc(customerId)
        .collection('favourites');

    if (isFavourite) {
      await favourites.doc(favouriteDocId).delete();
    } else {
      DocumentReference docRef =
          await favourites.add({'productId': widget.product.productId});
      favouriteDocId = docRef.id;
    }

    setState(() {
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SingleProductScreen.routeName,
              arguments: SelectedDetailedProduct(product: widget.product));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  widget.product.images[0],
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.title,
              //style: Theme.of(context).textTheme.bodyMedium,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs.${widget.product.price.toInt()}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: toggleFavourite,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: isFavourite
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      colorFilter: ColorFilter.mode(
                          isFavourite
                              ? const Color(0xFFFF4848)
                              : const Color(0xFFDBDEE4),
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
