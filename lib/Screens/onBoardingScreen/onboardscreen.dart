import 'package:flutter/material.dart';
import 'package:fyp/Screens/onBoardingScreen/onboradpages.dart';
import 'package:fyp/Screens/SignInScreen/sigin.dart';
import 'package:fyp/HelperMaterial/constant.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});
  static String routeName = "/onboard";

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentPage = 0;

  // This is list of data Which contains the text and the images to be displayed on the Onboard Screen
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to  SPORTY , Let’s shop!",
      "image": "assets/images/Onboard-Products.png"
    },
    {
      "text":
          "We help people to advertise their \n Events and Academies ",
      "image": "assets/images/OnBoard_Ads.jpg"
    },
    {
      "text":
          " A platform to Sell products \n Access the customers from Anywhere ",
      "image": "assets/images/Onboard_Seller.jpg"
    },
  ];
// This function Build the animated Dots Below the image Which Shows on the change of the page
  static  Widget buildDots(BuildContext context,int pageNumber,int number)
  {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: pageNumber == number ? 20 : 6,
      decoration: BoxDecoration(
        color: pageNumber == number
            ? kPrimaryColor
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
  // On Board Screen Implementation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  // Below is the Creation of the page which are created on the Number of items in the List
                  itemBuilder: (context, index) => OnBoardPages(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          // The Above function BuildDots called here for each Item in the
                          (index) => buildDots(context, currentPage, index)

                        ),
                      ),
                      const Spacer(flex: 3),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        child: const Text("Continue"),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
