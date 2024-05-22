import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/Advertisement/ads_notifire.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/Models/advertisemnet.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
import 'package:fyp/Screens/MyAdsScreen/myads.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../HelperMaterial/constant.dart';
import '../../HelperMaterial/errors.dart';
import '../../HelperMaterial/suffixicons.dart';

class PostAdScreen extends ConsumerStatefulWidget {
  static const String routeName = "/postads";

  @override
  _PostAdScreenState createState() => _PostAdScreenState();
}

class _PostAdScreenState extends ConsumerState<PostAdScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  // Variables to hold form data
  TextEditingController AdnameController = TextEditingController();
  TextEditingController AdvenueController = TextEditingController();
  TextEditingController AdfeeController = TextEditingController();
  TextEditingController AdorganizerController = TextEditingController();
  TextEditingController AdphoneController = TextEditingController();
  TextEditingController AdCategoryController = TextEditingController();
  File? AdImage;
  String? imageUrl;
  final List<String> errors = [];
  String? selectedCategory;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, HomeScreen.routeName);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Post Ads',
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Post Your Ads Here \n to boost your Event',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: AdnameController,
                  onSaved: (newValue) => AdnameController.text = newValue!,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kAdTitleNullError);
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kAdTitleNullError);
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Ad Title"),
                    hintText: "Enter Ad Title",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon:
                    CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: AdvenueController,
                  onSaved: (newValue) => AdvenueController.text = newValue!,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kAdVenueNullError);
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kAdVenueNullError);
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Ad Venue"),
                    hintText: "Enter Ad Venue",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon:
                    CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: AdfeeController,
                  onSaved: (newValue) => AdfeeController.text = newValue!,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kAdFeeNullError);
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kAdFeeNullError);
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Fee"),
                    hintText: "Enter Fee",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon:
                    CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: AdorganizerController,
                  onSaved: (newValue) => AdorganizerController.text = newValue!,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kAdOrganizerNameNullError);
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kAdOrganizerNameNullError);
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Organizer Name"),
                    hintText: "Enter Organizer Name",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon:
                    CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: AdphoneController,
                  onSaved: (newValue) => AdphoneController.text = newValue!,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kAdPhoneNumberNullError);
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kAdPhoneNumberNullError);
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Phone Number"),
                    hintText: "Enter Phone Number",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon:
                    CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      label: Text(
                        "Select Category",
                        style: TextStyle(color: Colors.black.withOpacity(0.8)),
                      )),
                  borderRadius: BorderRadius.circular(40),
                  value: selectedCategory,
                  onSaved: (newValue) => selectedCategory = newValue!,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: <String>[
                    'Select Category',
                    'Event',
                    'Academy',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 500,
                  height: 120,
                  padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 300.0,
                      child: AdImage == null
                          ? const Center(
                        child: Icon(Icons.image,
                            size: 40, color: kPrimaryColor),
                      )
                          : GridView.builder(
                        itemCount: 1,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                              child: //kIsWeb
                              // ? Image.network(AdImage!.path)
                              Image.file(AdImage!));
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    AdImage = await ref
                        .watch(adProvider.notifier)
                        .pickImagesFromGallery();
                    setState(() {});
                    // controller.productImageController;
                  },
                  child: const Text("Select Image"),
                ),
                FormError(errors: errors),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                      const CircularProgressIndicator(
                        color: kPrimaryColor,
                      );
                    });
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();

                      imageUrl = (await ref
                          .read(adProvider.notifier)
                          .uploadAdImage(AdImage, context));
                      // String? userID = ref.read(authServicesProvider).authenticatedId();
                      String userID =
                      await ref.read(authServicesProvider).getUserId();
                      String uniqueAdId = DateTime.now().millisecondsSinceEpoch.toString();
                      Advertisements ads = Advertisements(
                        adID: uniqueAdId,
                        adsName: AdnameController.text,
                        venue: AdvenueController.text,
                        fee: int.parse(AdfeeController.text),
                        organizerName: AdorganizerController.text,
                        phoneNo: AdphoneController.text,
                        category: selectedCategory!,
                        userId: userID,
                        image: imageUrl!,
                        isApproved: 'Pending',
                        isDeleted: false,
                      );
                      if (context.mounted) {
                        await ref
                            .read(adProvider.notifier)
                            .uploadAdsToFirebase(ads, context);
                      }
                    }
                    setState(() {
                      _formkey.currentState?.reset();
                      isLoading = false; // Set loading state to false after upload
                    });
                    setState(() {});
                    isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text("Send Request");
                  }, child: const Text("Send Request"),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}