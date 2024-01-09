import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/AdminPanel/Components/HeaderComponents/image_container.dart';
import 'package:fyp/Screens/AdminPanel/Components/reuest.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fyp/Screens/AdminPanel/Models/advertisemnet.dart';
import 'package:fyp/Screens/AdminPanel/Models/eventsads.dart';
import 'package:fyp/Screens/AdminPanel/Models/academies.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Advertisements? adsType;
  List<Advertisements> selectedList = [];
  Color academyButtonColor = Colors.white;
  Color eventButtonColor = kPrimaryColor;
  Widget buildNavigationLine(BuildContext context, Color color) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      height: 5,
      width: 130,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          centerTitle: true,
          title: Text(
            "Sporty",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: kPrimaryColor,
              ),
            )
          ],
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  gradient: kPrimaryGradientColor,
                  //color: kPrimaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8), // Shadow color
                      spreadRadius: 4, // Spread radius
                      blurRadius: 6.0, // Blur radius
                      offset:
                          const Offset(0, 4), // Offset in x and y directions
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Image Container used in the header section for the Profile picture of the Admin
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 12, 0),
                      child: ImageContainer(),
                    ),
                    Container(
                      width: 4,
                      height: 145,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            'Hi Admin!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 2.0),
                            child: AutoSizeText(
                              'Muhammad Hanan Haider',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  '20011598-086',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Each Column contains the
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextButton(
                        onPressed: () {
                          if (selectedList.isEmpty ||
                              selectedList == listOfAcademiesAds) {
                            setState(() {
                              selectedList = listOfEventsAds;
                              adsType = listOfEventsAds[0];
                              eventButtonColor = kPrimaryColor;
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets
                              .zero, // Optional, removes default padding
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ), // Set the font size
                        ),
                        child: const Text(
                          'Events',
                          style: TextStyle(color: kTextColor),
                        ),
                      ),
                    ),
                    buildNavigationLine(context, eventButtonColor),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (selectedList.isEmpty ||
                                selectedList == listOfEventsAds) {
                              academyButtonColor = kPrimaryColor;
                              eventButtonColor = Colors.white;
                              selectedList = listOfAcademiesAds;
                            }
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets
                              .zero, // Optional, removes default padding
                          textStyle: const TextStyle(
                              fontSize: 20), // Set the font size
                        ),
                        child: const Text(
                          'Academies',
                          style: TextStyle(
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ),
                    buildNavigationLine(context, academyButtonColor),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Requests',
                style: TextStyle(color: Colors.black38),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black38,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:10,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder:(_,int index)
              {
                return const RequestCards();
              }),
            ),
          ],
        )));
  }
}
