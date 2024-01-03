import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          decoration: InputDecoration(
            hintText:"Enter to search Product",
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            suffixIcon: IconButton(
              icon:Icon(Icons.search_outlined),
              onPressed: ()
              {},
            ),
          ),
        ),
      );
  }
}
