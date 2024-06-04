// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
         elevation: 1,
         color: kPrimaryLightColor.withOpacity(1),
         margin: const EdgeInsets.all(10),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(
                 width: 140,
                 height: 155,
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
             ),
             const SizedBox(width:5),
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
                     Text.rich(
                     TextSpan(
                       children: <TextSpan>[
                         TextSpan(
                           text: 'Venue: ',
                           style: TextStyle(fontWeight: FontWeight.bold),
                         ),
                         TextSpan(
                           text: ad.venue,
                           style: TextStyle(fontWeight: FontWeight.normal),
                         ),
                       ],
                     ),),
                     //Text('Phone: ${ad.phoneNo}'),
                     Text.rich(
                       TextSpan(
                         children: <TextSpan>[
                           TextSpan(
                             text: 'Phone: ',
                             style: TextStyle(fontWeight: FontWeight.bold),
                           ),
                           TextSpan(
                             text: ad.phoneNo,
                             style: TextStyle(fontWeight: FontWeight.normal),
                           ),
                         ],
                       ),),
                     const SizedBox(height: 8),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text.rich(
                           TextSpan(
                             children: <TextSpan>[
                               TextSpan(
                                 text: 'Organizer: ',
                                 style: TextStyle(fontWeight: FontWeight.bold),
                               ),
                               TextSpan(
                                 text: ad.organizerName,
                                 style: TextStyle(fontWeight: FontWeight.normal),
                               ),
                             ],
                           ),),
                         Text.rich(
                           TextSpan(
                             children: <TextSpan>[
                               TextSpan(
                                 text: 'Fee: ',
                                 style: TextStyle(fontWeight: FontWeight.bold),
                               ),
                               TextSpan(
                                 text: ad.fee.toString(),
                                 style: TextStyle(fontWeight: FontWeight.normal),
                               ),
                             ],
                           ),),
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
 }

Stream<List<Advertisements>> getAdsFromFirebase() {
  return FirebaseFirestore.instance
      .collection('Ads')
      .limit(3)
      .where('isApproved', isEqualTo: 'Confirmed')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Advertisements.fromJson(doc.data())).toList());
}
