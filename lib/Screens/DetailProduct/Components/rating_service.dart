import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Models/product_model.dart';

class RatingService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addRating(int productId, double rating) async {


    QuerySnapshot querySnapshot = await firestore
        .collection('products')
        .where('productId', isEqualTo: productId)
        .get();


    if (querySnapshot.docs.isEmpty) {
      throw Exception('Product does not exist');
    }

    DocumentSnapshot productSnapshot = querySnapshot.docs.first;
    DocumentReference productRef = productSnapshot.reference;

    await firestore.runTransaction((transaction) async {
      DocumentSnapshot freshSnapshot = await transaction.get(productRef);
      if (!freshSnapshot.exists) {
        throw Exception('Product does not exist');
      }

      double currentRating = freshSnapshot['rating'] ?? 0.0;
      int ratingsCount = freshSnapshot['ratingCount'] ?? 0;
      double totalRatingSum = freshSnapshot['totalRatingSum'] ?? 0.0;

      ratingsCount += 1;
      totalRatingSum += rating;
      currentRating = totalRatingSum / ratingsCount;

      transaction.update(productRef, {
        'rating': currentRating,
        'ratingCount': ratingsCount,
        'totalRatingSum': totalRatingSum,
      });
    });
  }


  Future<void> updateAdApprovalStatus(String productId, double rating) async {
    try {
      DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('products').doc()
         // .where('productId', isEqualTo: productId)
          .get();
      if (!productSnapshot.exists) {
        // ignore: avoid_print
        print("Found: $productId");
        final product =
            Products.fromJson(productSnapshot.data() as Map<String, dynamic>);

        double currentRating = product.rating;
        int ratingsCount = product.ratingCount;
        double totalRatingSum = product.totalRatingSum;

        ratingsCount += 1;
        totalRatingSum += rating;
        currentRating = totalRatingSum / ratingsCount;

        await FirebaseFirestore.instance
            .collection('products')
            .doc(productId)
            .update({
          'rating': currentRating,
          'ratingCount': ratingsCount,
          'totalRatingSum': totalRatingSum,
        });
        // ignore: avoid_print
        print("Product $productId Updated.");
      } else {
                // ignore: avoid_print
        print("Product $productId not found.");
      }
    } catch (e) {
              // ignore: avoid_print
      print("Product Updating Error $e");
    }
  }
}
