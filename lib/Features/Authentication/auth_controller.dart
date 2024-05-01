import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/Features/Authentication/auth_service.dart';


class AuthenticationController {
  final AuthServices _auth;
  AuthenticationController(this._auth);
 

  void registerUser(
      {required String email,
      required String password,
      required String userType,
      required BuildContext context}) {
    _auth.registerUser(
        email: email, password: password, userType: userType, context: context);
      
  }

}
