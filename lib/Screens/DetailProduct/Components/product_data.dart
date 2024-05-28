import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/product_model.dart';

import '../../../Features/providers.dart';

class ProductData extends ConsumerStatefulWidget {
  const ProductData({super.key, required this.product});
  final Products product;

  @override
  ConsumerState<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends ConsumerState<ProductData> {
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
      DocumentReference docRef = await favourites.add({'productId': widget.product.productId});
      favouriteDocId = docRef.id;
    }

    setState(() {
      isFavourite = !isFavourite;
    });
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
                widget.product.title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: toggleFavourite,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  //height: 16,
                  width: 48,
                  decoration: BoxDecoration(
                    color: isFavourite
                        ? const Color(0xFFFFE6E6)
                            : const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(25),
                    //shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    colorFilter: ColorFilter.mode(
                        isFavourite
                            ? const Color(0xFFFF4848)
                            : const Color(0xFFDBDEE4),
                        BlendMode.srcIn),
                    height: 16,
                  ),
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
              Text(
                  "Rs. ${widget.product.price.toInt()}",
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )
              ),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      ],
    );
  }
}

// class ProductData extends StatelessWidget {
//   const ProductData({super.key, required this.product});
//   final Products product;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 product.title,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 width: 48,
//                 decoration: BoxDecoration(
//                   color: product.isFavourite!
//                       ? const Color(0xFFFFE6E6)
//                       : const Color(0xFFF5F6F9),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: SvgPicture.asset(
//                   "assets/icons/Heart Icon_2.svg",
//                   colorFilter: ColorFilter.mode(
//                       product.isFavourite!
//                           ? const Color(0xFFFF4848)
//                           : const Color(0xFFDBDEE4),
//                       BlendMode.srcIn),
//                   height: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             left: 25,
//             // right: 64,
//           ),
//           child: Column(
//             children: [
//               Text(
//                 "Rs. ${product.price.toInt()}",
//                 style: const TextStyle(
//                   color: kPrimaryColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 )
//               ),
//               const SizedBox(height: 5,),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
