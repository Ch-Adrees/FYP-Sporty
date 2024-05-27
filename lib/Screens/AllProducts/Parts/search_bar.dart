// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          decoration: InputDecoration(
            hintText:"Search Products",
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            suffixIcon: IconButton(
              icon:Icon(Icons.search_outlined),
              onPressed: ()
              {},
            ),
          ),
          onChanged:(value){

          },
        ),
      );
  }
}
