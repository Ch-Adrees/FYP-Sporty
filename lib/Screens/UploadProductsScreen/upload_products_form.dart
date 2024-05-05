import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Features/Product/product_controller.dart';
import 'package:fyp/Features/provi_wid.dart';
import 'package:fyp/HelperMaterial/errors.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/HelperMaterial/suffixicons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

//import '../../Features/provi_wid.dart';
class UploadProductsForm extends StatefulWidget {
  const UploadProductsForm({super.key});

  @override
  UploadProductsFormState createState() => UploadProductsFormState();
}

class UploadProductsFormState extends State<UploadProductsForm> {
  var controller = Get.put(ProductController());
  final _formkey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? productCode,
      productTitle,
      productDescription,
      productQuantity,
      productPrice,
      productCategory;

  List<File> productImages = [];
  Color? productColors;
  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final pickedfile = await picker.pickMultiImage(imageQuality: 100, maxHeight: 1000, maxWidth: 1000);

      List<XFile> image = pickedfile;
      setState(() {
        if(image.isNotEmpty){
          for(var i=0; i< image.length; i++){
            productImages.add(File(image[i].path));
          }
        }else{
          ProviderWidgets.showFlutterToast(context, 'Image picking cancelled or failed');
        }
      });
    } catch (e) {
      ProviderWidgets.showFlutterToast(context, 'Error picking image');
    }
  }

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
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => productCode = newValue,
            controller: controller.productCodeController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kProductCodeNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kProductCodeNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              label: Text("Product Code"),
              hintText: "Enter Product code",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.productTitleController,
            onSaved: (newValue) => productTitle = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kProductTitleNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kProductTitleNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Product Title",
              hintText: "Enter Product Title",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            //keyboardType: TextInputType.phone,
            onSaved: (newValue) => productDescription = newValue,
            controller: controller.productDescriptionController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kProductDescriptionNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kProductDescriptionNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Product Description",
              hintText: "Enter Product Description",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/Phone.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            //keyboardType: TextInputType.phone,
            onSaved: (newValue) => productCategory = newValue,
            controller: controller.productCategoryController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kProductCategoryNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kProductCategoryNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Product Category",
              hintText: "Enter Product Category",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/Phone.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: controller.productQuantityController,
            onSaved: (newValue) => productQuantity = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kProductQuantityNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kProductQuantityNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Product Quantity",
              hintText: "Enter no. of items",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                  CustomSuffixIcons(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: controller.productPriceController,
            onSaved: (newValue) => productPrice = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kProductPriceNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kProductPriceNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Product Price",
              hintText: "Enter Product Price (Rs)",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                  CustomSuffixIcons(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
              child: productImages.isEmpty
                  ? const Center(child: Icon(
                              Icons.image,
                              size: 40,
                              color: kPrimaryColor
              ),
              )
                  : GridView.builder(
                itemCount: productImages.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,),
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                      child: kIsWeb
                          ? Image.network(productImages[index].path)
                          : Image.file(productImages[index]));
                },
              ),
            ),
          ),
      ),

          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              pickImage();
              controller.productImageController;
            },
            child: const Text("Select Images"),
          ),
          FormError(errors: errors),
          const SizedBox(height: 30),
          // controller.isLoading
          //    ? const CircularProgressIndicator(color: kPrimaryColor)
               ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      //controller.isLoading = true;
                      await controller.UploadImages();
                      await controller.UploadProduct();
                      Get.back();
                      //Navigator.pushNamed(context, SellerHomeScreen.routeName);
                      //Navigator.pushNamed(context, SellerHomeScreen.routeName);
                    }
                  },
                  child: const Text("Upload"),
                ),
        ],
      ),
    );
  }
}
