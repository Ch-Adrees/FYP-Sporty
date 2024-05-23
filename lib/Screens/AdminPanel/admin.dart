

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Screens/AdminPanel/Components/HeaderComponents/image_container.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fyp/Models/advertisemnet.dart';

import '../../Features/provi_wid.dart';
import 'package:fyp/Features/Advertisement/ads_notifire.dart';

import '../SignInScreen/sigin.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});
  static String routeName = "/admin_home";

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Color academyButtonColor = Colors.white;
  Color eventButtonColor = kPrimaryColor;
  String selectedButton = 'Event';


  Future<void> updateAdApprovalStatus(String docId, String approveStatus) async {
    try {
      await FirebaseFirestore.instance.collection('Ads').doc(docId).update({'isApproved': approveStatus});
      ProviderWidgets.showFlutterToast(context, 'Ad $approveStatus');
    } catch (e) {
      ProviderWidgets.showFlutterToast(context, 'Error Updating Ad Status: $e');
    }
  }

  //This function built the animated line below the tab bars
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
          title: const Text(
            "Sporty",
            style: TextStyle(
              fontSize: 26.0,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: IconButton(
                onPressed: () {Navigator.pushNamed(context, SignInScreen.routeName);},
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
                      color: kPrimaryColor,
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
                          width: 2,
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
                              {
                                setState(() {
                                  academyButtonColor = Colors.white;
                                  eventButtonColor = kPrimaryColor;
                                  selectedButton = "Event";
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
                                academyButtonColor = kPrimaryColor;
                                eventButtonColor = Colors.white;
                                selectedButton = "Academy";
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.black,
                ),
                Expanded(
                    child: buildPostList(),
                ),
              ],
            )));
  }

  Widget buildPostList() {
    return StreamBuilder<QuerySnapshot>(
      stream: getAdsFromFirebase(selectedButton),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(
            color: kPrimaryColor,));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
              child: Text('No Ad found.', style: TextStyle(fontSize: 20),));
        }

        List<Advertisements> adsList = snapshot.data!.docs.map((docSnapshot) {
          return Advertisements.fromJson(docSnapshot.data() as Map<String, dynamic>);
        }).toList();
        return ListView.builder(
          itemCount: adsList.length,
          itemBuilder: (context, index) {
            DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
            String docId = documentSnapshot.id;
            Advertisements ad = adsList[index];
            return buildRequestCards(docId, ad);
          },
        );
      },
    );

  }

  Widget buildRequestCards(String docId, Advertisements ad) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 210,
        decoration: BoxDecoration(
          //color: kPrimaryLightColor,
          gradient: kPrimaryGradientColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8), // Shadow color
              spreadRadius: 4, // Spread radius
              blurRadius: 5.0, // Blur radius
              offset:
              const Offset(0, 3), // Offset in x and y directions
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100,
                height: 170,
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
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Flexible(
                  child: AutoSizeText(
                    ad.adsName,
                    style: const  TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      //decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  const Text(
                  'Name:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                    const SizedBox(width: 5),
                    Text(ad.organizerName),
                    //cardTextAnswer(context, ad.organizerName),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Venue:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(ad.venue),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'PhoneNo:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(ad.phoneNo),
                  ],
                ),
                const SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 15),
                    const Text(
                      'Fee:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text('${ad.fee}'),
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: IconButton (
                              onPressed: () {
                                setState(() {
                                  String approveStatus = 'Declined';
                                  updateAdApprovalStatus(docId, approveStatus);
                                });
                              }, icon: const Icon(Icons.close)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  String approveStatus = 'Confirmed';
                                  updateAdApprovalStatus(docId, approveStatus);
                                });

                              }, icon: const Icon(Icons.check)),
                        ),
                      ),
                    ],
                  ),
                )
              ],),
          ],
        ),
      ), );
  }

}

Stream<QuerySnapshot> getAdsFromFirebase(String selectedButton) {
  return FirebaseFirestore.instance
      .collection('Ads')
  .where('isApproved', isEqualTo: 'Pending')
      .where('category', isEqualTo: selectedButton)
      .snapshots();

}

