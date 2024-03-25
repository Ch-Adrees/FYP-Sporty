

import 'package:flutter/material.dart';
//import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:flutter/cupertino.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/HelperMaterial/suffixicons.dart';
import 'package:fyp/HelperMaterial/errors.dart';
import 'package:fyp/Screens/SellerHomeScreen/seller_home_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  CompleteProfileFormState createState() => CompleteProfileFormState();

}
class CompleteProfileFormState extends State<CompleteProfileForm>{
  final _formkey = GlobalKey<FormState>();
  final List<String> errors =[];
  String? firstName, lastName, shopName, phoneNo, address;
  //File? _image;
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
            onSaved: (newValue) => firstName = newValue,
            onChanged: (value){
              if(value.isNotEmpty){
                removeError(error: kNameNullError);
              }
              return;
            },
            validator: (value){
              if(value!.isEmpty){
                addError(error: kNameNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              label: Text("First Name"),
              hintText: "Enter your First Name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => lastName = newValue,
            onChanged: (value){
              if(value.isNotEmpty){
                removeError(error: kNameNullError);
              }
              return;
            },
            validator: (value){
              if(value!.isEmpty){
                addError(error: kNameNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Last Name",
              hintText: "Enter your last name",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phoneNo = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPhoneNumberNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPhoneNumberNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Phone Number",
              hintText: "Enter your phone number",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/Phone.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => shopName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kShopNameNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kShopNameNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Shop Name",
              hintText: "Enter your shop name",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => address = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kAddressNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kAddressNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Address",
              hintText: "Enter your address",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcons(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),


          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () async {
              // final pickedImage =
              await ImagePicker().pickImage(source: ImageSource.gallery);
            },
            child: const Text("Select Image"),
          ),
         const SizedBox(height: 30),
         FormError(errors: errors),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
                Navigator.pushNamed(context, SellerHomeScreen.routeName);
                //Navigator.pushNamed(context, SellerHomeScreen.routeName);

              }
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}


// Future<void> _pickImage() async {
//   final ImagePicker _picker = ImagePicker();
//   XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//
//   if (image != null) {
//     // Process the selected image (save it, display it, etc.)
//     // You can set the image variable in your state to display it in the UI
//   }
// }


// ElevatedButton normal1(BuildContext context) {
//   return ElevatedButton(
//     onPressed: () async {
//       ImagePickerPlus picker = ImagePickerPlus(context);
//
//       SelectedImagesDetails? details =
//       await picker.pickImage(source: ImageSource.gallery);
//       if (details != null) await displayDetails(details);
//     },
//     child: const Text("Normal 1"),
//   );
// }

// Future<void> displayDetails(SelectedImagesDetails details) async {
//   await Navigator.of(context).push(
//     CupertinoPageRoute(
//       builder: (context) {
//         // return DisplayImages(
//         //     selectedBytes: details.selectedFiles,
//         //     details: details,
//         //     aspectRatio: details.aspectRatio);
//       },
//     ),
//   );
//}