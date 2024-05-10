import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';


class ProductController extends GetxController{
  var isLoading = false;
  var productCodeController = TextEditingController();
  var productTitleController = TextEditingController();
  var productCategoryController = TextEditingController();
  var productDescriptionController = TextEditingController();
  var productQuantityController = TextEditingController();
  var productPriceController = TextEditingController();
  var productImageController = RxList<dynamic>.generate(10, (index) => null);
  var productImageLink =[];
  var productColorController = TextEditingController();
  //final FirebaseFirestore firestore = FirebaseFirestore.instance;


  uploadImages() async {
    productImageLink.clear();
    for (var item in productImageController) {
      try {
        if(item!= null) {
          var filename = basename(item.path);
          var destination = 'images/sellers/$productCodeController/$filename';
          Reference ref = FirebaseStorage.instance.ref().child(destination);
          await ref.putFile(item);
          var n = await ref.getDownloadURL();
          productImageLink.add(n);
          debugPrint(productImageLink.toString());
          //Fluttertoast.showToast(msg: 'Successfully upload image');
        }
      }
    catch(e){
      debugPrint("Failed to upload images: $e");
    Fluttertoast.showToast(msg: "Failed to upload images");
    //ProviderWidgets.showFlutterToast(context, "Failed to upload images");
    }
  }

    // if(productImageController!= null){
    //   try {
    //     var filename = basename(productImageController.path);
    //     var destination = 'images/sellers/${productCodeController}/$filename';
    //     Reference ref = FirebaseStorage.instance.ref().child(destination);
    //     await ref.putFile(productImageController);
    //     productImageLink = await ref.getDownloadURL();
    //     //Fluttertoast.showToast(msg: 'Successfully upload image');
    //   }catch(e){
    //     Fluttertoast.showToast(msg: 'Failed to upload image');
    //   }
    //
    //
    // }
    // try {
    //   final ref = firebase_storage.FirebaseStorage.instance.ref().child('images/seller').child('$productCodeController.jpg');
    //   await ref.putFile(productImageController);
    //   productImageLink = await ref.getDownloadURL();
    // } catch (e) {
    //   Fluttertoast.showToast(msg: 'Failed to upload image');
    //   //print('Failed to upload image: $e');
    //   rethrow;
    // }
  }

  uploadProduct() async{

    //  FirebaseFirestore.instance.collection("products").add({
    //   'p_code': productCodeController,
    //   'p_title': productTitleController,
    //   'p_category': productCategoryController,
    //   'p_description': productDescriptionController,
    //   'p_quantity': productQuantityController,
    //   'p_price': productPriceController,
    //   'p_images': productImageLink,
    //   'p_seller': '',
    // }).then((_){
    //   isLoading = false;
    //   Fluttertoast.showToast(msg: 'Product Uploaded');
    // });
  //   Fluttertoast.showToast(msg: 'Product Uploaded');
    FirebaseFirestore.instance.collection('products').doc().set({
      'p_code': productCodeController.text,
      'p_title': productTitleController.text,
      'p_category': productCategoryController.text,
      'p_description': productDescriptionController.text,
      'p_quantity': productQuantityController.text,
      'p_price': productPriceController.text,
      'p_images': FieldValue.arrayUnion(productImageLink),
      'p_seller': '',
    });
    isLoading = false;
    Fluttertoast.showToast(msg: 'Product Uploaded');
  }
}
