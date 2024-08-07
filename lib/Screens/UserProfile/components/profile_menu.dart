// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../HelperMaterial/constant.dart';
class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key, required this.text, required this.icon, required this.press,
  });

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(18),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 18,
            ),
            Expanded(
                child: Text(
              text,
              //style: Theme.of(context).textTheme.bodyText1,
            ),
            ),
            Icon(Icons.arrow_forward_ios, color: kPrimaryColor,),
          ],
        ),
      ),
    );
  }
}