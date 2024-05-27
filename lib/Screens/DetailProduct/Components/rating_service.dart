import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../Features/provi_wid.dart';
import '../../../Models/product_model.dart';

class RatingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addRating(String productId, double rating) async {
    DocumentReference productRef =
        _firestore.collection('products').doc(productId);

    // Run transaction to ensure consistency
    await _firestore.runTransaction((transaction) async {
      DocumentSnapshot productSnapshot = await transaction.get(productRef);
      if (!productSnapshot.exists) {
        throw Exception('Product does not exist');
      }

      double currentRating = productSnapshot['rating'] ?? 0.0;
      int ratingsCount = productSnapshot['ratingsCount'] ?? 0;
      double totalRatingSum = productSnapshot['totalRatingSum'] ?? 0.0;

      // Update values
      ratingsCount += 1;
      totalRatingSum += rating;
      currentRating = totalRatingSum / ratingsCount;

      // Update product document with new ratings and average rating
      transaction.update(productRef, {
        'rating': currentRating,
        'ratingsCount': ratingsCount,
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
        print("Product $productId Updated.");
      } else {
        print("Product $productId not found.");
      }
    } catch (e) {
      print("Product Updating Error $e");
    }
  }
}
