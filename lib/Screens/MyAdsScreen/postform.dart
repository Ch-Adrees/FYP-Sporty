// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
import 'package:fyp/Screens/MyAdsScreen/myads.dart';
import 'package:image_picker/image_picker.dart';

import '../../HelperMaterial/constant.dart';

class Post {
  final String title;
  final String venue;
  final String date;
  final String fee;
  final String organizerName;
  final String phoneNumber;
  final String category;
  final String image;

  Post({required this.title, required this.venue, required this.date, required this.fee, required this.organizerName, required this.phoneNumber, required this.category, required this.image});

 
}

class PostAdScreen extends StatefulWidget {
  static const String routeName = "/postads";

  @override
  _PostAdScreenState createState() => _PostAdScreenState();
}

class _PostAdScreenState extends State<PostAdScreen> {
  // Variables to hold form data
  TextEditingController titleController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  XFile? _pickedImage;

  String selectedCity = 'Select City';
  String selectedCategory = 'Select Category';

 Future<void> _pickImage() async {
  try {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    } else {
      print('Image picking cancelled or failed.');
    }
  } catch (e) {
    print('Error picking image: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Ad'),
        centerTitle: true,
        backgroundColor: Color(0xFFFFECDF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
      ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Post Your Ads Here'),
              SizedBox(height: 25,),
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Ad Name'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: cityController,
               // maxLines: 4,
                decoration: InputDecoration(labelText: 'Venue'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(labelText: 'Date'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Fee'),
              ),
                SizedBox(height: 16),
              TextField(
                controller: textController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Organizer Name'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 16),
              DropdownButton<String>(
                value: selectedCategory,
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
                    child: Text(value,style: TextStyle(color: Color(0xFFCC5656)),),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
             GestureDetector(
  onTap: _pickImage,
  child: Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(color: kPrimaryColor, width: 2.0),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        if (_pickedImage != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.file(
              File(_pickedImage!.path),
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
        if (_pickedImage == null)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.image,
                size: 40,
                color: kPrimaryColor,
              ),
              SizedBox(height: 8),
              Text(
                'Upload Image',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
      ],
    ),
  ),
),

SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _postAd();
                },
                child: Text('Post Ad'),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  _cancelPostAd();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _postAd() {
  // Validate the form fields before posting
  if (_validateForm()) {
    // Create a Post object with the collected data
    var newPost = Post(
      title: titleController.text,
      phoneNumber: phoneController.text,
      category: selectedCategory,
      image: _pickedImage != null ? _pickedImage!.path : '',
      venue: cityController.text,
      date: dateController.text,
      fee: numberController.text,
      organizerName: textController.text,
    );

    // Navigate to MyAdsScreen and pass the newPost data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyAdsScreen(newPost: newPost,)
      ),
    );
  }
}


  // Function to validate the form fields
  bool _validateForm() {
    return true;
  }

  void _cancelPostAd() {
    // Clear the form fields
    titleController.clear();
    cityController.clear();
    phoneController.clear();
   // Navigator.pop(context);
    Navigator.popAndPushNamed(context, HomeScreen.routeName);

    // Reset the selected city and category
    setState(() {
      selectedCity = 'Select City';
      selectedCategory = 'Select Category';
    });

    // Reset the picked image
    setState(() {
      _pickedImage = null;
    }
   );
  }
}
