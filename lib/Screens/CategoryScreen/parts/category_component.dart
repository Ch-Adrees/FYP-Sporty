import 'package:flutter/material.dart';
import 'package:fyp/Screens/CategoryScreen/Models/Category.dart';
import '../../../HelperMaterial/constant.dart';

class CategoriesNames extends StatelessWidget {
  const CategoriesNames(
      {super.key,
      required this.onPress,
      required this.colorValue,
      required this.categ});
  final VoidCallback onPress;
  final bool colorValue;
  final Category categ;

  Widget buildNavigationLine(BuildContext context,bool color) {
    print(color);
    return AnimatedContainer(
      duration: kAnimationDuration,
      height:4,
      width:30,
      decoration: BoxDecoration(
        color: color ? kPrimaryColor : Colors.cyanAccent,
        borderRadius: BorderRadius.circular(10),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            onPress;
          },
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 15, color:
            Colors.black38),
          ),
          child: Center(
            child: Text(categ.category_name),
          ),
        ),
        buildNavigationLine(context,colorValue),
      ],
    );
  }
}
