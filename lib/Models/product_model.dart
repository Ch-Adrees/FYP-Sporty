

class Products {
  final int productId, ratingCount, productCode;
  final String title, description;
  final List<String> images;
  final double rating, price, totalRatingSum;
  final bool? isFavourite, isPopular;
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
    this.isPopular = false,
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
      'images':images,
      'rating': rating,
      'price': price,
      'productCategory': productCategory,
      'isFavourite': isFavourite,
      'isPopular': isPopular,
      'sellerId': sellerId,
      'isDeleted': isDeleted,
      'ratingCount': ratingCount,
      'totalRatingSum': totalRatingSum,
    };
  }

  factory Products.fromJson(Map<String, dynamic> map) {
    return Products(
      productId: map['productId'] as int,
      productCode: map['productCode'],
      title: map['title'] as String,
      description: map['description'] as String,
      images:List<String>.from(map['images'] as List ),// Cast to List<String>
      rating: map['rating'], // Use nullable num for rating
      totalRatingSum: map['totalRatingSum'],
      ratingCount: map['ratingCount'],
      price: map['price'], // Use nullable num for price
      isFavourite: map['isFavourite'] as bool?, // Nullable boolean
      isPopular: map['isPopular'] as bool?, // Nullable boolean
      sellerId: map['sellerId'] as String?,
      productCategory: map['productCategory'] as String?,
      isDeleted: map['isDeleted'] as bool?, // Nullable boolean
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
