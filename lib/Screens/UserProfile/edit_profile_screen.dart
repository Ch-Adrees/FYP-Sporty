// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_print, avoid_unnecessary_containers, unnecessary_new, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:fyp/Screens/UserProfile/components/profile_pic.dart';
import 'package:fyp/Screens/UserProfile/components/profile_screen.dart';

import '../../HelperMaterial/constant.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/editprofile';
  const EditProfileScreen({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePic(),
                SizedBox(height: 5),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfileScreen(
                                        name: _name.text,
                                        email: _email.text,
                                      ))); // Implement save functionality here
                              print('Save button pressed');
                            },
                            child: Text('Save'),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Implement cancel functionality here
                              Navigator.popAndPushNamed(
                                  context,
                                  ProfileScreen
                                      .routeName); // Close the current screen
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFFFE6E6)), // Change color here
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
