import 'package:fyp/Models/user_model.dart';

class SellerModel extends UserModel {
  final String shopName;
  final String shopAddress;
  SellerModel({
    required this.shopName,
    required this.shopAddress,
    required super.nameOfUser,
    required super.phoneNumber,
    required super.address,
    required super.profilePic,
    required super.userId,
    required super.username,
  });

  @override
  Map<String, dynamic> userToMap() {
    Map<String, dynamic> userMap = super.userToMap();
    userMap['shopName'] = shopName;
    userMap['shopAdress'] = shopAddress;
    return userMap;
  }

  @override
  SellerModel copyWith({
    String? nameOfUser,
    String? username,
    String? phoneNumber,
    String? address,
    String? profilePic,
    String? userId,
    String? shopName,
    String? shopAddress,
  }) {
    return SellerModel(
      nameOfUser: nameOfUser ?? this.nameOfUser,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      profilePic: profilePic ?? this.profilePic,
      userId: userId ?? this.userId,
      shopName: shopName ?? this.shopName,
      shopAddress: shopAddress ?? this.shopAddress,
    );
  }

  factory SellerModel.fromMap(Map<String, dynamic> map) {
    return SellerModel(
        shopName: map['shopName'],
        shopAddress: map['shopAdress'],
        nameOfUser: map['nameOfUser'],
        phoneNumber: map['phoneNumber'],
        address: map['address'],
        profilePic: map['profilePic'],
        userId: map['userId'],
        username: map['username']);
  }
}
