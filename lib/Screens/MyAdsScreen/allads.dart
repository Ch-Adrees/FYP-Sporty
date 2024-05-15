// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
import 'package:fyp/Screens/MyAdsScreen/postform.dart';
import 'package:get/get.dart';

import '../../HelperMaterial/constant.dart';
import '../../Models/academies.dart';
import '../../Models/advertisemnet.dart';
import '../../Models/eventsads.dart';

class AllAdsScreen extends StatefulWidget {
  static const String routeName = "/allpost";
  final Post? newPost;

  const AllAdsScreen({this.newPost});

  @override
  State<AllAdsScreen> createState() => _AllAdsScreenState();
}

class _AllAdsScreenState extends State<AllAdsScreen> {
  Advertisements? adsType;
  List<Advertisements> selectedList = listOfEventsAds;
  Color academyButtonColor = Colors.white;
  Color eventButtonColor = kPrimaryColor;

  // Dummy data for testing - replace it with your actual data
  List<EventsAds> eventAdsList = listOfEventsAds;
  List<AcademiesAds> academiesAdsList = listOfAcademiesAds;

  // This function builds a card for each post
  Widget buildPostCard(Advertisements ad) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            child: Image.asset(
              'assets/images/avatar.png', // Use a default image or ad-specific image property
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ad.adsName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Venue: ${ad.venue}'),
                  Text('Date: ${ad.date}'),
                  Text('Phone: 1234567890'), // Assuming a default phone number for now
                  const SizedBox(height: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Organizer: ${ad.organizerName}'),
                      Text('Fee: ${ad.fee}'), 
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // This function builds the list of cards based on the selected category
  Widget buildPostList() {
    List<Advertisements> adsList =
        selectedList == listOfEventsAds ? eventAdsList : academiesAdsList;

    return ListView.builder(
      itemCount: adsList.length,
      itemBuilder: (context, index) {
        return buildPostCard(adsList[index]);
      },
    );
  }

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
        title: const Text(
          'All Ads',
          //textAlign: TextAlign.center,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            academyButtonColor = Colors.white;
                            eventButtonColor = kPrimaryColor;
                            selectedList = listOfEventsAds;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
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
                            academyButtonColor = kPrimaryColor;
                            eventButtonColor = Colors.white;
                            selectedList = listOfAcademiesAds;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
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
            Expanded(
              child: buildPostList(),
            ),
          ],
        ),
      ),
    );
  }
}
