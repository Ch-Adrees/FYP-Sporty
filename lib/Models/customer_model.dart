import 'package:fyp/Models/user_model.dart';

class CustomerModel extends UserModel {
  CustomerModel({
    required String nameOfUser,
    required String phoneNumber,
    required String address,
    required String profilePic,
    required String userId,
    required String username,
  }) : super(
          nameOfUser: nameOfUser,
          phoneNumber: phoneNumber,
          address: address,
          profilePic: profilePic,
          userId: userId,
          username: username,
        );
@override
  Map<String, dynamic> userToMap() {
    return super.userToMap();
  }
}
