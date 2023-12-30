import 'package:flutter/material.dart';

class Products {
  final int productId;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Products({
    required this.productId,
    required this.images,
    required this.colors,
    required this.title,
    required this.price,
    required this.description,
    this.isFavourite = false,
    this.isPopular = false,
    this.rating = 0.0,
  });
}
const String description="Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

List<Products> demoProducts=[
  Products(
    productId: 1,
images: [
"assets/images/ps4_console_white_1.png",
"assets/images/ps4_console_white_2.png",
"assets/images/ps4_console_white_3.png",
"assets/images/ps4_console_white_4.png",
],
colors: [
const Color(0xFFF6625E),
const Color(0xFF836DB8),
const Color(0xFFDECB9C),
Colors.white,
],
title: "Wireless Controller for PS4™",
price: 64.99,
description: description,
rating: 4.8,
isFavourite: true,
isPopular: true,
),
Products(
productId: 2,
images: [
"assets/images/Image Popular Product 2.png",
],
colors: [
const Color(0xFFF6625E),
const Color(0xFF836DB8),
const Color(0xFFDECB9C),
Colors.white,
],
title: "Nike Sport White - Man Pant",
price: 50.5,
description: description,
rating: 4.1,
isPopular: true,
),
Products(
productId: 3,
images: [
"assets/images/glap.png",
],
colors: [
const Color(0xFFF6625E),
const Color(0xFF836DB8),
const Color(0xFFDECB9C),
Colors.white,
],
title: "Gloves XC Omega - Polygon",
price: 36.55,
description: description,
rating: 4.1,
isFavourite: true,
isPopular: true,
),
Products(
productId: 4,
images: [
"assets/images/wireless headset.png",
],
colors: [
const Color(0xFFF6625E),
const Color(0xFF836DB8),
const Color(0xFFDECB9C),
Colors.white,
],
title: "Logitech Head",
price: 20.20,
description: description,
rating: 4.1,
isFavourite: true,
),
Products(
productId: 1,
images: [
"assets/images/ps4_console_white_1.png",
"assets/images/ps4_console_white_2.png",
"assets/images/ps4_console_white_3.png",
"assets/images/ps4_console_white_4.png",
],
colors: [
const Color(0xFFF6625E),
const Color(0xFF836DB8),
const Color(0xFFDECB9C),
Colors.white,
],
title: "Wireless Controller for PS4™",
price: 64.99,
description: description,
rating: 4.8,
isFavourite: true,
isPopular: true,
),
Products(
productId: 2,
images: [
"assets/images/Image Popular Product 2.png",
],
colors: [
const Color(0xFFF6625E),
const Color(0xFF836DB8),
const Color(0xFFDECB9C),
Colors.white,
],
title: "Nike Sport White - Man Pant",
price: 50.5,
description: description,
rating: 4.1,
isPopular: true,
),
Products(
productId: 3,
images: [
"assets/images/glap.png",
],
colors: [
const Color(0xFFF6625E),
const Color(0xFF836DB8),
const Color(0xFFDECB9C),
Colors.white,
],
title: "Gloves XC Omega - Polygon",
price: 36.55,
description: description,
rating: 4.1,
isFavourite: true,
isPopular: true,
),
Products(
productId: 4,
images: [
"assets/images/wireless headset.png",
],
colors: [
const Color(0xFFF6625E),
const Color(0xFF836DB8),
const Color(0xFFDECB9C),
Colors.white,
],
title: "Logitech Head",
price: 20.20,
description: description,
rating: 4.1,
isFavourite: true,
),
  ];
