// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Screens/HomeScreen/section_title.dart';
import 'package:fyp/Screens/HomeScreen/catagorycard.dart';

import '../CategoryScreen/catagory_screen.dart';

//import '../CategoryScreen/catagories_screen.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Cricket"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Football"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Hockey"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Badminton"},
      {"icon": "assets/icons/Discover.svg", "text": "Tennis"},
    ];
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SectionTitle(
          title: "Categories",
          press: () {
            Navigator.pushNamed(context,CategoryScreen.routeName);
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {},
            ),
          ),
        ),
      ),
    ]);
  }
}



