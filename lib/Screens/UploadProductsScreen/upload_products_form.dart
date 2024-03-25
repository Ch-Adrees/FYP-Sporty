import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/errors.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/HelperMaterial/suffixicons.dart';
import 'package:image_picker/image_picker.dart';
class UploadProductsForm extends StatefulWidget {
  const UploadProductsForm({super.key});

  @override
  UploadProductsFormState createState() => UploadProductsFormState();
}

class UploadProductsFormState extends State<UploadProductsForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> errors =[];
  String? productCode, productTitle, productDescription, productQuantity, productPrice;

  Image? productImages;
  Color? productColors;
  void addError({String? error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error!);
      });
    }
  }
  void removeError({String? error}){
    if(errors.contains(error)){
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
            onChanged: (value){
              if(value.isNotEmpty){
                removeError(error: kProductCodeNullError);
              }
              return;
            },
            validator: (value){
              if(value!.isEmpty){
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
            onSaved: (newValue) => productTitle = newValue,
            onChanged: (value){
              if(value.isNotEmpty){
                removeError(error: kProductTitleNullError);
              }
              return;
            },
            validator: (value){
              if(value!.isEmpty){
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
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => productDescription = newValue,
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
            keyboardType: TextInputType.phone,
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
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.phone,
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
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),
          const SizedBox(height: 20,),
          //Add images and color bar
          ElevatedButton(
            onPressed: () async {
              // final pickedImage =
              await ImagePicker().pickImage(source: ImageSource.gallery);
            },
            child: const Text("Select Image"),
          ),
          FormError(errors: errors),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
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
