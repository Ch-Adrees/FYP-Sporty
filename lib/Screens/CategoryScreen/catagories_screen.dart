import 'package:flutter/material.dart';
import 'package:fyp/Screens/CategoryScreen/Models/Category.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static String routeName = "/Category";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<bool> isSelectedIndex =
      List.generate(listOfCategories.length, (index) => false);
 late  Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfCategories.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {

                            });
                          },
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black38),
                          ),
                          child:Center(
                            child: Text(category.category_name),
                          ),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
