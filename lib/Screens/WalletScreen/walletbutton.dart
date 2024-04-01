// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WalletButtons extends StatelessWidget {
  final String iconPath;
  final String textButton;
  final VoidCallback press;

  const WalletButtons({
    Key? key,
    required this.iconPath,
    required this.textButton,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical:28),
          height: 55,
          width: 200,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFFFECDF),
          ),
          child: ElevatedButton(
            onPressed: press,
            style: ElevatedButton.styleFrom(
              //primary: const Color(0xFFFFECDF),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  iconPath,
                  color: const Color(0xFFCC5656),
                  width: 22,
                ),
                const SizedBox(width: 18,),
                Expanded(
                  child: Text(
                    textButton,
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Color(0xFFCC5656)),
                    ),
                  ),
              ],
            ),
          ),
        );
  }
}
