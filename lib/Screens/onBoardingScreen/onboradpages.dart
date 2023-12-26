import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';

class OnBoardPages extends StatefulWidget {
  const OnBoardPages({Key? key,
  this.text,
  this.image}):super(key: key);
  final String? text,image;


  @override
  State<OnBoardPages> createState() => _OnBoardPagesState();
}

class _OnBoardPagesState extends State<OnBoardPages> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(flex: 2,),
        const Text(
          "SPORTY",
          style: TextStyle(
            fontSize: 32,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          widget.image!,

          height: 320,
          width: 350,
        ),
      ],
    );
  }
}


