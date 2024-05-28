import 'package:flutter/material.dart';
import 'package:fyp/Screens/DetailProduct/Components/product_color_circle.dart';
import 'package:fyp/Models/product_model.dart';

import '../../../HelperMaterial/constant.dart';
class ProductQuantity extends StatefulWidget {
  const ProductQuantity({super.key, required this.product});

  final Products product;

  @override
  ProductQuantityState createState() => ProductQuantityState();
}

class ProductQuantityState extends State<ProductQuantity> {
  int productQuantity = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                if(productQuantity>0){
                  productQuantity--;}},
              );},
          ),
          const SizedBox(width: 10),
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              //borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              productQuantity.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(width: 10),
          RoundedIconBtn(
            icon: Icons.add,
            press: () {
              setState(() {
                productQuantity++;
              });}
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
        Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
