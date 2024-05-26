class Advertisements{

  final String adsName,venue, adID;

  final int fee;
  final String organizerName;
  final String phoneNo, image, category, userId;
      String isApproved ;
  bool isDeleted;



  Advertisements({
    required this.adID,
    required this. category,
    required this. image,
    required this.adsName,
    required this.venue,
    required this.fee,
    required this.organizerName,
    required this.phoneNo,
    required this.isApproved,
    required this.isDeleted,
    required this.userId,
});

  Map<String, dynamic> toJson() {
    return {
      'adID': adID,
      'adsName': adsName,
      'venue': venue,
      'fee': fee,
      'category':category,
      'organizerName': organizerName,
      'organizerPhoneNo':phoneNo,
      'isApproved':isApproved,
      'isDeleted':isDeleted,
      'userid': userId,
      'adImage':image,
    };
  }

  factory Advertisements.fromJson(Map<String, dynamic> json) {
    return Advertisements(
      adID: json['adID'],
      adsName: json['adsName'],
      venue: json['venue'],
      fee: json['fee'],
      organizerName: json['organizerName'],
      phoneNo: json['organizerPhoneNo'],
      image: json['adImage'],
      category: json['category'],
      userId: json['userid'],
      isApproved: json['isApproved'],
      isDeleted: json['isDeleted'],
    );
  }

}