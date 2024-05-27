import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/catagory_model.dart';
import 'package:fyp/Screens/Cart%20Screen/cart_screen.dart';
//import 'package:fyp/Models/catagory_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static String routeName = "/Category_screen";
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> selectedcategory = [];
  @override
  initState() {
    selectedcategory = listOfCategories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool isSearching = false;

    // Category selectedCategory = Category(category_name: "All");

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {Navigator.pushNamed(context, MyCartScreen.routeName);},
              icon: const Icon(Icons.shopping_cart_checkout_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 22.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  
                  decoration: const InputDecoration(
                      hintText: "Search by Category",
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black38, // specify your desired color
                      ),
                      suffixIcon: Icon(Icons.search_sharp)),
                  onTap: () {
                    // List<Category> selectedcategory = [];
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedcategory = listOfCategories
                          .where((category) => category.categoryName
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
              ),
            ),
            Expanded(
                child: selectedcategory.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            //  padding: const EdgeInsets.all(8),
                            children:
                                List.generate(selectedcategory.length, (index) {
                              Color color =
                                  listOfColors[index % listOfColors.length];
                              String path =
                                  imagesPath[index % imagesPath.length];
                              return Card(
                                color: color,
                                shadowColor: kPrimaryLightColor,
                                surfaceTintColor: kPrimaryColor,
                                borderOnForeground: true,
                                elevation: 6.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 16.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 120,
                                            decoration: const BoxDecoration(
                                              color: Colors
                                                  .blue, // Background color of the container
                                              shape: BoxShape
                                                  .circle, // Shape of the container (circular)
                                            ),
                                            child: ClipOval(
                                              child: Image.asset(
                                                path,
                                                fit: BoxFit.cover,
                                                width: 120,
                                                height: 120,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            selectedcategory[index]
                                                .categoryName,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color:
                                                  kTextColor, // Set text color
                                              fontWeight: FontWeight
                                                  .w600, // Set text style
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })))
                    : const Text(
                        "No Result Found",
                        style: TextStyle(fontSize: 20),
                      )),
          ],
        ),
      ),
    );
  }
}
