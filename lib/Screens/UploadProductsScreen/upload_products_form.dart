import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/providers.dart';
import 'package:fyp/HelperMaterial/errors.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/HelperMaterial/suffixicons.dart';
import 'package:fyp/Models/catagory_model.dart';
import 'package:fyp/Models/product_model.dart';

class UploadProductsForm extends ConsumerStatefulWidget {
  const UploadProductsForm({super.key});

  @override
  UploadProductsFormState createState() => UploadProductsFormState();
}

class UploadProductsFormState extends ConsumerState<UploadProductsForm> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
   String? selectedCategory;
  final List<String> errors = [];
  late List<String> imagesUrls = [];
  List<File> productImages = [];
  Color? productColors;
  List<Color> colors = [];
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

  void clearForm() {
    productCodeController.clear();
    productTitleController.clear();
    productDescriptionController.clear();
    productPriceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //autovalidateMode: AutovalidateMode.always,
      key: _formkey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: productCodeController,
            onSaved: (newValue) => productCodeController.text = newValue!,
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
              label: Text("Product Code"),
              hintText: "Enter Product code",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: productTitleController,
            onSaved: (newValue) => productTitleController.text = newValue!,
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
            controller: productDescriptionController,
            onSaved: (newValue) =>
                productDescriptionController.text = newValue!,
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
            keyboardType: TextInputType.phone,
            controller: productPriceController,
            onSaved: (newValue) => productPriceController.text = newValue!,
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
              suffixIcon: Icon(
                Icons.money,
                color: Colors.black38,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  label: Text(
                "Select Category",
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
              )),
              isDense: true,
              borderRadius: BorderRadius.circular(60),
              value: selectedCategory,
              hint: const Text(
                'Select Product Category',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 30,
              isExpanded: false,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: listOfCategories
                  .map<DropdownMenuItem<String>>((Category category) {
                return DropdownMenuItem<String>(
                  value: category.categoryName,
                  child: Text(category.categoryName),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
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
                    ? const Center(
                        child:
                            Icon(Icons.image, size: 40, color: kPrimaryColor),
                      )
                    : GridView.builder(
                        itemCount: productImages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                              child: //kIsWeb
                                  //? Image.network(productImages[index].path)
                                  Image.file(productImages[index]));
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
              productImages = await ref
                  .watch(productProvider.notifier)
                  .pickImagesFromGallery();
              setState(() {});
            },
            child: const Text("Select Images"),
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
                imagesUrls = await ref
                    .read(productProvider.notifier)
                    .uploadImagesToDatabase(productImages, context);
                String sellerId =
                    await ref.read(authServicesProvider).getUserId();
                Products product = Products(
                    productId: int.parse(productCodeController.text),
                    productCategory: selectedCategory!,
                    images: imagesUrls,
                    colors: colors,
                    title: productTitleController.text,
                    price: double.parse(productPriceController.text),
                    sellerId: sellerId,
                    isDeleted: false,
                    description: productDescriptionController.text);
                if (context.mounted) {
                  await ref
                      .read(productProvider.notifier)
                      .uploadProductToFirebase(product, context);
                }
                productImages = [];
                isLoading = false;
                selectedCategory = null;
              }
              clearForm();
              setState(() {
                // Set loading state to false after upload
              });
            },
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text("Upload"),
          ),
        ],
      ),
    );
  }
}
