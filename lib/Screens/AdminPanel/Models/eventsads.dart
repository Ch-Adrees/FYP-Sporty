import 'package:flutter/material.dart';
import 'package:fyp/Screens/AdminPanel/Models/advertisemnet.dart';
class EventsAds extends Advertisements{
  EventsAds({required super.adsName, required super.venue, required super.date, required super.fee, required super.organizerName});


}
DateTime now=DateTime.now();
List<EventsAds> listOfEventsAds=
[
  EventsAds(adsName: 'Jagal Cricket Tournament', venue: 'Jagal,Kotla', date:DateTime(now.year,now.month,now.day) ,fee: 1000, organizerName: 'Hanan'),
  EventsAds(adsName: 'Jehlum Cricket Tournament', venue: 'Chittan,Jehlum', date:DateTime(now.year,now.month,now.day) ,fee: 2000, organizerName: 'Zain'),
  EventsAds(adsName: 'Jhans Cricket Tournament', venue: 'Jhans,Gujrat', date:DateTime(now.year,now.month,now.day) ,fee: 3000, organizerName: 'Adrees'),
  EventsAds(adsName: 'Tibba Cricket Tournament', venue: 'Tibba,Gujrat', date:DateTime(now.year,now.month,now.day) ,fee: 4000, organizerName: 'Rehan'),
  EventsAds(adsName: 'Gujrat Cricket Tournament', venue: 'Hriawala,Gujrat', date:DateTime(now.year,now.month,now.day) ,fee: 5000, organizerName: 'GMDT'),
  EventsAds(adsName: 'Sialkot Cricket Tournament', venue: 'China Chowk,Sialkot', date:DateTime(now.year,now.month,now.day) ,fee: 6000, organizerName: 'Mian Ali'),
];