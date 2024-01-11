// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen/ads_detail.dart';
import 'package:fyp/Screens/HomeScreen/section_title.dart';

 class AdsSlider extends StatelessWidget {
   const AdsSlider({super.key});

   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         Padding(padding: EdgeInsets.symmetric(horizontal: 20),
         child: SectionTitle(
           title: "Event & Academy Ads",
           press: (){},
         ),
         ),
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             children: [
               AdsDetail(
                 image: "assets/images/Image Banner 2.png",
                 category: "Event",
                 phoneno: 18,
                 press: () {
                   //Navigator.pushNamed(context, ProductsScreen.routeName);
                 },
               ),
               AdsDetail(
                 image: "assets/images/Image Banner 3.png",
                 category: "Academy",
                 phoneno: 19,
                 press: () {
                   //Navigator.pushNamed(context, ProductsScreen.routeName);
                 },
               ),
               const SizedBox(width: 20),
             ],
           ),
         )
       ],
     );
   }
 }
