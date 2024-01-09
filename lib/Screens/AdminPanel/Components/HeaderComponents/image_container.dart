import 'package:flutter/material.dart';
import '../../../../HelperMaterial/constant.dart';


class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 95,
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(20.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/passSize.jpg'),
            fit: BoxFit.cover,
          )),
    );
  }
}
