// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/AdminPanel/Models/advertisemnet.dart';

class RequestCards extends StatelessWidget {
  const RequestCards({super.key, required this.ads, });
  final Advertisements ads ;

  Widget cardText(BuildContext context, String? value) {
    return Text(
      '$value',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget cardTextAnswer(BuildContext context, String? value) {
    return Text(
      '$value',
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 210,
        decoration: BoxDecoration(
// color: kPrimaryLightColor,
         gradient: kPrimaryGradientColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8), // Shadow color
              spreadRadius: 4, // Spread radius
              blurRadius: 5.0, // Blur radius
              offset:
              const Offset(0, 3), // Offset in x and y directions
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.cyanAccent.withOpacity(0.2),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/man-waiter-icon.svg', // Replace with your SVG path
                            width: 35,
                            height: 35,
                            fit: BoxFit.cover,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                    Flexible(
                    child: AutoSizeText(
                      '$ads.adsName',
                      style: const  TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cardText(context, 'Name:'),
                    const SizedBox(width: 4),
                    cardTextAnswer(context, '$ads.organizerName'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cardText(context, 'Venue:'),
                    const SizedBox(width: 4),
                    cardTextAnswer(context, '$ads.venue'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cardText(context, 'Date:'),
                    const SizedBox(width: 4),
                    cardTextAnswer(context, '$ads.date'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cardText(context, 'Fee:'),
                    const SizedBox(width: 4),
                    cardTextAnswer(context, '2000'),
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Center(
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.check)),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.close)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
