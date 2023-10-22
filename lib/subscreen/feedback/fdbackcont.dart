import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class fdBackController extends GetxController{
  var _firebaseFirestore = FirebaseFirestore.instance;
  var length;
  var nameList = [];
  var timeList = [];
  var discpList = [];
  var idList ;
  getData()async{
    
    var d = await _firebaseFirestore.collection("accessory").doc("feedback").get();
    length = d.data()?.length;
    var data = d.data();
    nameList.length = length;
    timeList.length = length;
    discpList.length = length;
    idList = data?.keys;
    for(int x = 0 ; x< length ; x++){
      nameList[x] = data?[idList.elementAt(x)]['Name'];
      discpList[x] = data?[idList.elementAt(x)]['Discription'];
      var t = DateTime.fromMillisecondsSinceEpoch(data?[idList.elementAt(x)]['Time'].seconds);
      var s = t.toString().split(".")[0];
      timeList[x] = s;
    }
    
    

  }
   
}