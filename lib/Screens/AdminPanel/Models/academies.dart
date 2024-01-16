// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:fyp/Screens/AdminPanel/Models/advertisemnet.dart';

class AcademiesAds extends Advertisements{
  AcademiesAds({required super.adsName, required super.venue, required super.date, required super.fee, required super.organizerName});


}
DateTime now=DateTime.now();
List<AcademiesAds> listOfAcademiesAds=[
  AcademiesAds(adsName:'Gujrat Academy', venue:'Gujrat',date:DateTime(now.year,now.month,now.day), fee:1000, organizerName: 'Hanan'),
  AcademiesAds(adsName:'LalaMusa Academy', venue:'Gujrat',date:DateTime(now.year,now.month,now.day), fee:1000, organizerName: 'GMDT'),
  AcademiesAds(adsName:'Harianwala Academy', venue:'Gujrat',date:DateTime(now.year,now.month,now.day), fee:1000, organizerName: 'Adrees'),
  AcademiesAds(adsName:'Chitttan Academy', venue:'Gujrat',date:DateTime(now.year,now.month,now.day), fee:1000, organizerName: 'Rehan'),
  AcademiesAds(adsName:'Jagal Academy', venue:'Gujrat',date:DateTime(now.year,now.month,now.day), fee:1000, organizerName: 'Zain'),

];