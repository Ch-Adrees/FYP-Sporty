import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/Authentication/auth_service.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/Models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class ProductNotifier extends StateNotifier<List<Products>> {
  ProductNotifier(super.state);
  AuthServices auth = AuthServices();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  List<File> getFiles(List<XFile> xfile) {
    List<File> files = [];
    for (XFile x in xfile) {
      File file = File(x.path);
      files.add(file);
    }
    return files;
  }

  Future<List<File>> pickImagesFromGallery() async {
    List<File> files = [];
    ImagePicker imagePicker = ImagePicker();
    List<XFile> selectedImages = await imagePicker.pickMultiImage();
    files = getFiles(selectedImages);
    if (selectedImages.isNotEmpty) {
      return files;
    } else {
      return files;
    }
  }

  Future<List<String>> uploadImagesToDatabase(
      List<File> pickedImages, BuildContext context) async {
    List<String> imagesUrls = [];
    try {
      if (pickedImages.isEmpty) {
        ProviderWidgets.showFlutterToast(context, "Images are not selected");
        throw Exception("No Images is Selected");
      }
      for (int i = 0; i < pickedImages.length; i++) {
        Reference storageReference = storage.ref().child(
            'images/productsImages/${DateTime.now().millisecondsSinceEpoch}.jpg');
        await storageReference.putFile(pickedImages[i]);
        String imageUrl = await storageReference.getDownloadURL();
        imagesUrls.add(imageUrl);
      }
      if (context.mounted) {
        ProviderWidgets.showFlutterToast(
            context, "Images has been Save to the Firebase");
      }
    } catch (e) {
      if (context.mounted) {
        ProviderWidgets.showFlutterToast(context, e.toString());
      }
      debugPrint("The error is ${e.toString()}");
    }
    return imagesUrls;
  }

  Future<void> uploadProductToFirebase(
      Products product, BuildContext context) async {
    try {
      await _firestore.collection('products').add(product.toJson()).then(
          (value) => ProviderWidgets.showFlutterToast(
              context, "Product has been Added Successfully."));
    } catch (e) {
      if (context.mounted) {
        ProviderWidgets.showFlutterToast(context, e.toString());
      }
    }
  }
}
