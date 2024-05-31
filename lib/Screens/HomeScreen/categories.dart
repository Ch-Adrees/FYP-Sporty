// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/Screens/HomeScreen/section_title.dart';
import 'package:fyp/Screens/HomeScreen/catagorycard.dart';

import '../CategoryScreen/catagory_screen.dart';
import '../CategoryScreen/category_product.dart';

//import '../CategoryScreen/catagories_screen.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/cricket-sport-icon.svg", "text": "Cricket"},
      {"icon": "assets/icons/ball-football-icon.svg", "text": "Football"},
      {"icon": "assets/icons/hockey-icon.svg", "text": "Hockey"},
      {"icon": "assets/icons/swimming-icon.svg", "text": "Swimming"},
      {"icon": "assets/icons/tennis-icon.svg", "text": "Tennis"},
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
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProductPage(
                    categoryName: categories[index]['text'],
                    searchQuery: '',
                  ),
                ),
              );},
            ),
          ),
        ),
      ),
    ]);
  }
}



