// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, duplicate_ignore, must_be_immutable, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:fyp/HelperMaterial/constant.dart';
import 'package:fyp/HelperMaterial/enum.dart';
import 'package:fyp/Screens/UserProfile/components/body.dart';
import 'package:fyp/Screens/UserProfile/components/custom_bar.dart';
import 'package:fyp/Screens/UserProfile/edit_profile_screen.dart';
import 'package:fyp/Screens/HomeScreen/home_screen.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  String name,email;
 ProfileScreen({required this.name,required this.email,});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.0,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Stack(
                children: [
                  SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    radius: 50,
                    child: Image(image: 
                    AssetImage('assets/icons/username-icon.svg'),)),
                              ),
                        /*      Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: kPrimaryColor),
                                  //child:Icon(Icons.mode_edit_outline_outlined,color: Colors.blue,),
                                ),
                            )*/
                ],
              ),
            Text('Name:${name}',style:TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
            Text('Email:${email}',style:TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
            const SizedBox(height: 20,),

              Body(),
            ],
          ),
        ),
      )
     // child:NavigationBar(NavBarScreen()),
    //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
     
    );
  }
}
