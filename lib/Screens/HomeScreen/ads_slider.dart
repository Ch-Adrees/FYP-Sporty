// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen/ads_detail.dart';
import 'package:fyp/Screens/HomeScreen/section_title.dart';
import '../../HelperMaterial/constant.dart';
import '../../Models/advertisemnet.dart';
import '../MyAdsScreen/allads.dart';

 class AdsSlider extends StatelessWidget {
   const AdsSlider({super.key});

   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         Padding(padding: EdgeInsets.symmetric(horizontal: 20),
         child: SectionTitle(
           title: "Event & Academy Ads",
           press: (){
             Navigator.pushNamed(context, AllAdsScreen.routeName);
           },
         ),
         ),
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: buildPostList(),
         )
       ],
     );
   }

   Widget buildPostList(){
     return StreamBuilder<List<Advertisements>>(
       stream: getAdsFromFirebase(),
       builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
           return const Center(child: CircularProgressIndicator(
             color: kPrimaryColor,));
         }
         if (!snapshot.hasData || snapshot.data!.isEmpty) {
           return const Center(
               child: Text('No Ad found.'));
         }

         List<Advertisements> adsList = snapshot.data!;
         return Row(
           children: adsList.map((ad) => buildPostCard(ad)).toList(),
         );
       },
     );


   }

   Widget buildPostCard(Advertisements ad) {
     return SizedBox(
       width: 350,
       child: Card(
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
       ),
     );
   }

   //vList<Advertisements> adsList
 }

Stream<List<Advertisements>> getAdsFromFirebase() {
  return FirebaseFirestore.instance
      .collection('Ads')
      .limit(3)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Advertisements.fromJson(doc.data() as Map<String, dynamic>)).toList());
}
