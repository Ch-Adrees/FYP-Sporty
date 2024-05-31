abstract class UserModel {
  final String nameOfUser;
  final String phoneNumber;
  final String address;
  final String profilePic;
  final String userId;
  final String username;
  final String fcmToken;

  UserModel(
      {required this.nameOfUser,
      required this.phoneNumber,
      required this.address,
      required this.profilePic,
      required this.userId,
      required this.fcmToken,
      required this.username});

  UserModel copyWith({
    String? nameOfUser,
    String? username,
    String? phoneNumber,
    String? address,
    String? profilePic,
    String? userId,
  });
  Map<String, dynamic> userToMap() {
    return {
      'nameOfUser': nameOfUser,
      'phoneNumber': phoneNumber,
      'address': address,
      'profilePic': profilePic,
      'userId': userId,
      'username': username,
      'fcmToken':fcmToken,
    };
  }
}
