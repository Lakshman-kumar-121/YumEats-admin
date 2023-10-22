import 'package:adminpanel/subscreen/ChangeDaily/changedaily.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DailySpecialController extends GetxController{
  var _firebaseFirestore = FirebaseFirestore.instance;
  var dailydata;
  var monday;
  var tueday;
  var wedday;
  var thurday;
  var friday;
  var satday;
  var sunday;
  getData()async{
    var d = await _firebaseFirestore.collection("accessory").doc("daily_special").get();
    dailydata =  d.data();
    monday = dailydata['Monday'][0];
    tueday = dailydata['Tuesday'][0];
    wedday = dailydata['Wednesday'][0];
    thurday = dailydata['Thursday'][0];
    friday = dailydata['Friday'][0];
    satday = dailydata['Saturday'][0];
    sunday = dailydata['Sunday'][0];
    
  }

  gotoChangespecial(data , sunday)=> Get.to(()=> ChangeDailyData(data: data , day: sunday));
}