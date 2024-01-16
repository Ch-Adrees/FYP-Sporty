// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:get/get.dart';

class ProfilePicController extends GetxController {
  RxBool isProfilePicPathSet = false.obs;
  RxString profilePicPath = ''.obs;

  void setProfileImagePath(String path) {
    isProfilePicPathSet.value = true;
    profilePicPath.value = path;
  }
}
