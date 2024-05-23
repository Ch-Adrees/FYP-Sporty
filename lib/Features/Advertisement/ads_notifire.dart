import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Models/advertisemnet.dart';
import 'package:image_picker/image_picker.dart';

import '../provi_wid.dart';

class AdsNotifier extends StateNotifier<List<Advertisements>> {
  AdsNotifier(super.state);

  File getFiles(XFile xfile) {
    File file = File(xfile.path);
    return file;
  }

  Future<File?> pickImagesFromGallery() async {
    File? file;
    ImagePicker imagePicker = ImagePicker();
    XFile? selectedImages =
    await imagePicker.pickImage(source: ImageSource.gallery);
    file = getFiles(selectedImages!);

    return file;
  }

  Future<String?> uploadAdImage(File? imageFile, BuildContext context) async {
    String? imageUrl;
    try {
      if (imageFile == null) {
        ProviderWidgets.showFlutterToast(context, "Images are not selected");
        throw Exception("No Images is Selected");
      } else {
        Reference storageReference = FirebaseStorage.instance.ref().child(
            'images/adsImages/${DateTime
                .now()
                .millisecondsSinceEpoch}.jpg');
        await storageReference.putFile(imageFile);
        imageUrl = await storageReference.getDownloadURL();

        if (context.mounted) {
          ProviderWidgets.showFlutterToast(
              context, "Images has been Save to the Firebase");
        }
      }
    } catch (e) {
      if (context.mounted) {
        ProviderWidgets.showFlutterToast(context, e.toString());
      }
      debugPrint("The error is ${e.toString()}");
    }
    return imageUrl;
  }

  Future<void> uploadAdsToFirebase(Advertisements ad,
      BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection('Ads').add(ad.toJson()).then((
          value) {
        ProviderWidgets.showFlutterToast(context, " Ad Uploaded Sucessfully");
      });
    } catch (e) {
      if (context.mounted) {
        ProviderWidgets.showFlutterToast(context, e.toString());
      }
    }
  }

}
