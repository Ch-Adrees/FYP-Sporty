import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/HelperMaterial/suffixicons.dart';
import 'package:fyp/HelperMaterial/errors.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  CompleteProfileFormState createState() => CompleteProfileFormState();
}

class CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();

  final List<String> errors = [];
  //File? _image;
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
            onSaved: (newValue) => firstNameController.text = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNameNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
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
            onSaved: (newValue) => lastNameController.text = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNameNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
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
            onSaved: (newValue) => phoneNoController.text = newValue!,
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
            onSaved: (newValue) => shopNameController.text = newValue!,
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
              suffixIcon: IconTheme(
                data: IconThemeData(
                  color: Colors.black45,
                ),
                child: CustomSuffixIcons(svgIcon: "assets/icons/Shop Icon.svg"),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => shopAddressController.text = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNameNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNameNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              label: Text("Shop address"),
              hintText: "Enter your Shop address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                  CustomSuffixIcons(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onSaved: (newValue) => addressController.text = newValue!,
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
              labelText: "Adrees",
              hintText: "Enter your address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                  CustomSuffixIcons(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 30),
          FormError(errors: errors),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
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