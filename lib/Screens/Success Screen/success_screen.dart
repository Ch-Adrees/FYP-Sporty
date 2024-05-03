// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';

class SuccessScreen extends StatelessWidget {
  static String routeName = "/successscreen";
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            Image.asset(
              'assets/images/success.png',
              height: 250,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Success!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your order will be deliver soon... :)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Thank You!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text(
                'Continue Shopping',
              )),
        )
      ]),
    );
  }
}
