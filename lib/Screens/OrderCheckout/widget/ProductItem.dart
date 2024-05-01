// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;

  const ProductItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/product 1 image.png',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(title),
      trailing: Text('\$${price.toStringAsFixed(2)}'),
    );
  }
}
