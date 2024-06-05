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

  Future<void> updateProductData(
      BuildContext context,
      String? title,
      String? description,
      List<String>? images,
      double? price,
      String? productCategory,
      bool? isDeleted,
      int productCode) async {
    try {
      QuerySnapshot snap = await _firestore
          .collection('products')
          .where('productCode', isEqualTo: productCode)
          .get();
      List<DocumentSnapshot> documents = snap.docs;
      if (documents.isNotEmpty) {
        final DocumentSnapshot docs = documents[0];
        Products products =
            Products.fromJson(docs.data() as Map<String, dynamic>);
        Products newProduct = products.copyWith(
            title: title,
            description: description,
            images: images,
            price: price,
            productCategory: productCategory,
            isDeleted: isDeleted);

        await _firestore
            .collection('products')
            .doc(docs.id)
            .update(newProduct.toJson());
        ProviderWidgets.showFlutterToast(
            context, "Opearationa Successful !");
      }
    } catch (e) {
      ProviderWidgets.showFlutterToast(context, "Error: ${e.toString()}");
    }
  }

  Future<List<File>> pickImagesFromGallery() async {
    List<File> files = [];
    ImagePicker imagePicker = ImagePicker();
    List<XFile> selectedImages = await imagePicker.pickMultiImage();

    files = getFiles(selectedImages);

    return files;
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

  Future<List<Products>> getallProductsFromFirebase(
      BuildContext context) async {
    // List<Products> productsList = [];
    try {
      QuerySnapshot listofAllProducts =
          await _firestore.collection('products').where('isDeleted').get();

      for (var product in listofAllProducts.docs) {
        state.add(Products.fromJson(product.data() as Map<String, dynamic>));
      }
    } on FirebaseException catch (e) {
      if (context.mounted) {
        ProviderWidgets.showFlutterToast(context, e.message);
      }
    }
    return state;
  }

  Future<List<Products>> getOwnProduct(BuildContext context) async {
    String? uId = await auth.getUserId();
    List<Products> ownProducts = [];
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('products')
          .where('isDeleted', isEqualTo: false)
          .where('sellerId', isEqualTo: uId)
          .get();
      for (var document in snapshot.docs) {
        ownProducts
            .add(Products.fromJson(document.data() as Map<String, dynamic>));
      }
    } on FirebaseException catch (e) {
      if (context.mounted) {
        ProviderWidgets.showToast(context, "Error:${e.message}");
      }
    }
    return ownProducts;
  }
}
