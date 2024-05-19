import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../HelperMaterial/constant.dart';
import '../../Models/academies.dart';
import '../../Models/advertisemnet.dart';
import '../../Models/eventsads.dart';

class AllAdsScreen extends StatefulWidget {
  static const String routeName = "/allpost";

  const AllAdsScreen({super.key});

  @override
  State<AllAdsScreen> createState() => _AllAdsScreenState();
}

class _AllAdsScreenState extends State<AllAdsScreen> {
  Color academyButtonColor = Colors.white;
  Color eventButtonColor = kPrimaryColor;
  String selectedButton = 'Event';



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
                            selectedButton = 'Event';
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
                            selectedButton = 'Academy';
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

  Widget buildPostList() {
    return StreamBuilder<List<Advertisements>>(
      stream: getAdsFromFirebase(selectedButton),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(
            color: kPrimaryColor,));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Text('No Approved Ad found.'));
        }

        List<Advertisements> adsList = snapshot.data!;
        return ListView.builder(
          itemCount: adsList.length,
          itemBuilder: (context, index) {
            Advertisements ad = adsList[index];
            return buildPostCard(ad);
          },
        );
      },
    );
  }
  // This function builds a card for each post
  Widget buildPostCard(Advertisements ad) {
    return Card(
      elevation: 3,
      color: Colors.white24,
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: ad.image.isNotEmpty
                ? Image.network(
              ad.image,
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            )
                : Image.asset(
              'assets/icons/image-not-found-icon.svg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ad.adsName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Venue: ${ad.venue}'),
                  Text('Phone: ${ad.phoneNo}'),
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

  //vList<Advertisements> adsList


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

}
Stream<List<Advertisements>> getAdsFromFirebase(String selectedButton) {
  return FirebaseFirestore.instance
      .collection('Ads')
      //.where('isApproved', isEqualTo: 'Confirmed')
      .where('category', isEqualTo: selectedButton)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Advertisements.fromJson(doc.data() as Map<String, dynamic>)).toList());
}



