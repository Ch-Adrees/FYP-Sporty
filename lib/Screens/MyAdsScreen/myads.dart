// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, unnecessary_cast, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/Screens/MyAdsScreen/postform.dart';
import 'package:fyp/Screens/UserProfile/components/profile_screen.dart';
import 'package:get/get.dart';

import '../../HelperMaterial/constant.dart';
import '../AdminPanel/Models/academies.dart';
import '../AdminPanel/Models/advertisemnet.dart';
import '../AdminPanel/Models/eventsads.dart';

class MyAdsScreen extends StatefulWidget {
  static const String routeName = "/mypost";
  final Post? newPost;
  final String? imagePath;

  const MyAdsScreen({this.newPost, this.imagePath});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  Advertisements? adsType;
  List<Advertisements> selectedList = listOfEventsAds;
  Color academyButtonColor = Colors.white;
  Color eventButtonColor = kPrimaryColor;
  List<Post> allPosts = [];
  List<Post> eventPosts = [];
  List<Post> academyPosts = [];

  @override
  void initState() {
    super.initState();
    // Check if newPost is not null, then add it to the appropriate category
    if (widget.newPost != null) {
      _addPostToCategory(widget.newPost!);
    }
    allPosts.addAll(eventPosts);
    allPosts.addAll(academyPosts);
  }

  // Function to add a post to the appropriate category
  void _addPostToCategory(Post post) {
    setState(() {
      if (post.category == 'Event') {
        eventPosts.add(post);
      } else if (post.category == 'Academy') {
        academyPosts.add(post);
      }
    });
  }

  // This function builds a card for each post
  Widget buildPostCard(Post post) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 176,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: widget.imagePath != null
                    ? FileImage(File(widget.imagePath!))
                    : post.image.isNotEmpty
                        ? FileImage(File(post.image)) as ImageProvider
                        : AssetImage('assets/images/avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Venue: ${post.venue}'),
                  Text('Date: ${post.date}'),
                  Text('Phone: ${post.phoneNumber}'),
                  const SizedBox(height: 6),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Organizer: ${post.organizerName}'),
                      Text('Fee: ${post.fee}'),
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
    List<Post> posts =
        selectedList == listOfEventsAds ? eventPosts : academyPosts;

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return buildPostCard(posts[index++]);
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
        leading: IconButton(
          onPressed: () =>
              Navigator.popAndPushNamed(context, ProfileScreen.routeName),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('My Post'),
        centerTitle: true,
        backgroundColor: Color(0xFFFFECDF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
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
      // bottomNavigationBar:NavigationBar(NavBarScreen()),
    );
  }
}
