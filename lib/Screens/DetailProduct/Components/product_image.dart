import 'package:flutter/material.dart';
import 'package:fyp/Screens/DetailProduct/Components/product_small_images.dart';
import '../../../Models/product_model.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({
    Key? key,
    required this.prod,
  }) : super(key: key);

  final Products prod;
  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int selectedImageIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.prod.images[selectedImageIndex]),
          ),
        ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.prod.images.length,
                  (index) => SmallProductImage(
                isSelected: index == selectedImageIndex,
                press: () {
                  setState(() {
                    selectedImageIndex = index;
                  });
                },
                image: widget.prod.images[index],
              ),
            ),
          ],
        )
      ],
    );
  }
}
