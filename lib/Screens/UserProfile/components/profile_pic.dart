// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sort_child_properties_last, sort_child_properties_last, sort_child_properties_last

import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'picturecontroller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePic extends StatelessWidget {
  File? pickedfile;
  ImagePicker imagePicker = ImagePicker();
  ProfilePicController profilePicController = Get.put(ProfilePicController());

  @override
  Widget build(context) {
     
    return Container(
     padding:EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Obx(() => CircleAvatar(
                    radius: 74, // Set the radius to half of the container size
                    backgroundImage: profilePicController.isProfilePicPathSet.value == true
                        ? FileImage(File(profilePicController.profilePicPath.value)) as ImageProvider
                        : const AssetImage("assets/images/avatar.png"),
                  )),
              Positioned(
                bottom:0,
                right:25,
                child: SizedBox(
                  height: 45, // Adjust the size as needed
                  width: 45,// Adjust the size as needed
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => bottomSheet(context),
                      );
                    },
                    child: Icon(Icons.camera_enhance_rounded,color: Colors.white,size: 30,),
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(),
                      padding: EdgeInsets.all(0),
                    ),
                  ),
                ),
              ),
            ],
          ),
           // ignore: prefer_const_constructors
           const SizedBox(height:40),
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: Color(0xFFFFECDF),
      child: Column(
        children: [
          const Text(
            'Choose Profile Photo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Color(0xFFCC5656) ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, color: Color(0xFFCC5656)),
                    SizedBox(height: 5),
                    Text(
                      'Gallery',
                      style: TextStyle(color:Color(0xFFCC5656),
                        fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
              const SizedBox(width: 80),
              InkWell(
                child: const Column(
                  children: [
                    Icon(Icons.camera, color: Color(0xFFCC5656)),
                    SizedBox(height: 5),
                    Text(
                      'Camera',
                      style: TextStyle(color:Color(0xFFCC5656),fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage = await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedfile = File(pickedImage!.path);
    profilePicController.setProfileImagePath(pickedfile!.path);
    Get.back();
  }
}
