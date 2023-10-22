import 'package:adminpanel/User/Singleuser/singleuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class AllUserController extends GetxController{
  var firebasefirestore = FirebaseFirestore.instance;
  var uId = [];
  var data = [];
  var profileurl = [];
  var streak = [];
  var number = [];
  var datalen = 0;
   int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }
  getData()async{
    var d = await firebasefirestore.collection("users").get();
    // print(d.docs.);
    datalen =  d.docs.length;
    for(int i = 0 ; i< d.docs.length ; i++){
      uId.add(d.docs.elementAt(i).id);
      data.add(d.docs.elementAt(i).data());


        var lastdate = DateTime.fromMillisecondsSinceEpoch(
        data.elementAt(i)['streak']['Date'].seconds * 1000);
    var count = data.elementAt(i)['streak']['count'];
    var curdate = DateTime.now();
    var diff = daysBetween(lastdate, curdate);

          if (diff < 2 && diff >= 0) {
      
      streak.add( count);
    } else {
      streak.add( 0);
    }
    }
    

    }

    cleardata(){
       datalen = 0;
      uId.clear();
      data.clear();
      profileurl.clear();
      number.clear();
      streak.clear();
    }
gotoSingleUser(uid , data)=> Get.to(SingleUser(Uid: uid,data: data,));
}