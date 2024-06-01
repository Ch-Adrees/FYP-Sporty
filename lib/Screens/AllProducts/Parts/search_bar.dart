// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../CategoryScreen/category_product.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          onFieldSubmitted: (value) {
            if (value.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProductPage(
                    categoryName: '', // Pass an empty category or handle accordingly
                    searchQuery: value,
                  ),
                ),
              );
            }
          },
          decoration: InputDecoration(
            hintText:"Search Products",
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            suffixIcon:
              Icon(Icons.search),

          ),
        ),
      );
  }
}
