import 'package:flutter/material.dart';

class Products {
  final int productId, ratingCount, productCode;
  final String title, description;
  final List<String> images;
  final double rating, price, totalRatingSum;
  final bool? isFavourite;
  final String? sellerId;
  final String? productCategory;
  final bool? isDeleted;

  Products({
    required this.isDeleted,
    required this.productId,
    required this.productCode,
    required this.productCategory,
    required this.images,
    required this.title,
    required this.price,
    required this.sellerId,
    required this.description,
    this.isFavourite = false,
    this.rating = 0.0,
    this.ratingCount = 0,
    this.totalRatingSum = 0,
  });
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productCode': productCode,
      'title': title,
      'description': description,
      'images': images,
      'rating': rating,
      'price': price,
      'productCategory':productCategory,
      'isFavourite': isFavourite,
      'sellerId': sellerId,
      'isDeleted':isDeleted,
      'ratingCount':ratingCount,
      'totalRatingSum': totalRatingSum,
    };
  }

  // factory Products.fromJson(Map<String, dynamic> json) {
  //   return Products(
  //     productId: json['productId'],
  //     title: json['title'],
  //     description: json['description'],
  //     images: (json['images'] as List).cast<String>().toList(),
  //       colors: (json['colors'] as List).map((color) => Color(color)).toList(),
  //     rating: json['rating'].toDouble(),
  //     price: json['price'].toDouble(),
  //     isFavourite: json['isFavourite'] ?? false,
  //     isPopular: json['isPopular'] ?? false,
  //     sellerId: json['sellerId'],
  //     productCategory: json['productCategory'],
  //     isDeleted: json['isDeleted']
  //   );
  // }
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      productId: json['productId'] as int,
      productCode: json['productCode'],
      title: json['title'] as String,
      description: json['description'] as String,
      images: (json['images'] as List).cast<String>().toList(), // Cast to List<String>
      rating: json['rating'], // Use nullable num for rating
      totalRatingSum: json['totalRatingSum'],
      ratingCount: json['ratingCount'],
      price: json['price'], // Use nullable num for price
      isFavourite: json['isFavourite'] as bool?, // Nullable boolean
      sellerId: json['sellerId'] as String?,
      productCategory: json['productCategory'] as String?,
      isDeleted: json['isDeleted'] as bool?, // Nullable boolean
    );
  }

}

// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
//
// List<Products> demoProducts = [
//   Products(
//     productId: 1,
//     isDeleted: false,
//     productCategory: "Cricket",
//     sellerId: "12",
//     images: [
//       "assets/images/ps4_console_white_1.png",
//       "assets/images/ps4_console_white_2.png",
//       "assets/images/ps4_console_white_3.png",
//       "assets/images/ps4_console_white_4.png",
//     ],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Wireless Controller for PS4™",
//     price: 64,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true, productCode: null,
//   ),
//   Products(
//     productCategory: "Cricket",
//      isDeleted: false,
//     productId: 2,
//     sellerId: "12",
//     images: [
//       "assets/images/Image Popular Product 2.png",
//     ],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Nike Sport White - Man Pant",
//     price: 50,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Products(
//     productCategory: "Cricket",
//     sellerId: "12",
//      isDeleted: false,
//     productId: 3,
//     images: [
//       "assets/images/glap.png",
//     ],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Products(
//     productCategory: "Cricket",
//     sellerId: "12",
//      isDeleted: false,
//     productId: 4,
//     images: [
//       "assets/images/wireless headset.png",
//     ],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Logitech Head",
//     price: 20,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
//   Products(
//     productCategory: "Cricket",
//     sellerId: "12",
//      isDeleted: false,
//     productId: 1,
//     images: [
//       "assets/images/ps4_console_white_1.png",
//       "assets/images/ps4_console_white_2.png",
//       "assets/images/ps4_console_white_3.png",
//       "assets/images/ps4_console_white_4.png",
//     ],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Wireless Controller for PS4™",
//     price: 64,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Products(
//     productCategory: "Cricket",
//     sellerId: "12",
//      isDeleted: false,
//     productId: 2,
//     images: [
//       "assets/images/Image Popular Product 2.png",
//     ],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Nike Sport White - Man Pant",
//     price: 50,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Products(
//     productCategory: "Cricket",
//     sellerId: "12",
//      isDeleted: false,
//     productId: 3,
//     images: [
//       "assets/images/glap.png",
//     ],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Products(
//     productCategory: "Cricket",
//     sellerId: "12",
//      isDeleted: false,
//     productId: 4,
//     images: [
//       "assets/images/wireless headset.png",
//     ],
//     colors: [
//       const Color(0xFFF6625E),
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Logitech Head",
//     price: 20,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
//
// ];
