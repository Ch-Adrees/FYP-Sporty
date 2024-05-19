import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/Models/advertisemnet.dart';

class RequestCards extends StatelessWidget {
  const RequestCards({super.key, required this.ad});
  final Advertisements ad;

  Widget cardText(BuildContext context, String? value) {
    return Text(
      '$value',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget cardTextAnswer(BuildContext context, String? value) {
    return Text(
      '$value',
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [

              child: Row(
                children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 8.0),
                  //     child: Container(
                  //       height: 55,
                  //       width: 55,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: Colors.cyanAccent.withOpacity(0.2),
                  //       ),
                  //       child: Center(
                  //         child: SvgPicture.asset(
                  //           'assets/icons/man-waiter-icon.svg', // Replace with your SVG path
                  //           width: 35,
                  //           height: 35,
                  //           fit: BoxFit.cover,
                  //           color: Colors.black45,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  child: SizedBox(
                    width: 100,
                    height: 170,
                    child: Image.asset(
                      'assets/icons/image-not-found-icon.svg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),

              ),
                  const SizedBox(
                    width: 10,
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
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
                    cardText(context, 'Name:'),
                    const SizedBox(width: 5),
                    cardTextAnswer(context, ad.organizerName),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cardText(context, 'Venue:'),
                    const SizedBox(width: 5),
                    cardTextAnswer(context, ad.venue),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cardText(context, 'Phone No:'),
                    const SizedBox(width: 5),
                    cardTextAnswer(context, ad.phoneNo),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    cardText(context, 'Fee:'),
                    const SizedBox(width: 5),
                    cardTextAnswer(context, ad.fee as String?),
                  ],
                ),
                SizedBox(height: 10,),
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
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.close)),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
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
                              onPressed: () {}, icon: const Icon(Icons.check)),
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
