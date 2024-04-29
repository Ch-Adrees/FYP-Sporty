import 'package:fyp/Models/user_model.dart';

class SellerModel extends UserModel {

  final String shopName;
  final String shopAdress;
  SellerModel({
   
    required this.shopName,
    required this.shopAdress,
    required super.nameOfUser,
    required super.phoneNumber,
    required super.address,
    required super.profilePic,
    required super.userId,
    required super.username,
  });

@override
  Map<String,dynamic> userToMap()
  {
   Map<String ,dynamic> userMap=super.userToMap();
    userMap['shopName'] = shopName;
    userMap['shopAdress'] = shopAdress;
    return userMap;
    
  }
}
