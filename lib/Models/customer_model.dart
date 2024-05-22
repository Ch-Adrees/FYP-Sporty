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
  // ignore: unnecessary_overrides
  Map<String, dynamic> userToMap() {
    return super.userToMap();
  }
  
  @override
  UserModel copyWith({String? nameOfUser, String? username, String? phoneNumber, String? address, String? profilePic, String? userId, String? userType}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}
