import 'package:fyp/Models/user_model.dart';

class CustomerModel extends UserModel {
  CustomerModel({
    required String nameOfUser,
    required String phoneNumber,
    required String address,
    required String profilePic,
    required String userId,
    required String username,
    required String fcmToken,
  }) : super(
          nameOfUser: nameOfUser,
          phoneNumber: phoneNumber,
          address: address,
          profilePic: profilePic,
          userId: userId,
          username: username,
          fcmToken: fcmToken,
        );
  @override
  // ignore: unnecessary_overrides
  Map<String, dynamic> userToMap() {
    return super.userToMap();
  }

  @override
  CustomerModel copyWith(
      {String? nameOfUser,
      String? username,
      String? phoneNumber,
      String? address,
      String? profilePic,
      String? userId,
      String? fcmToken,
      String? userType}) {
    return CustomerModel(
        nameOfUser: nameOfUser ?? this.nameOfUser,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        profilePic: profilePic ?? this.profilePic,
        userId: userId ?? this.userId,
        username: username ?? this.username,
        fcmToken: fcmToken ?? this.fcmToken);
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      nameOfUser: map['nameOfUser'] as String,
      phoneNumber: map['phoneNumber'] as String,
      address: map['address'] as String,
      profilePic: map['profilePic'] as String,
      userId: map['userId'] as String,
      username: map['username']as String,
      fcmToken: map['fcmToken'] as String,
    );
  }
}
