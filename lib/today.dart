import 'package:adminpanel/Todaybillcont.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class TodayBill extends StatefulWidget {
   TodayBill({super.key});

  @override
  State<TodayBill> createState() => _TodayBillState();
}

class _TodayBillState extends State<TodayBill> {
   var _todaycont = Get.put(TodayBillController());
  var _firebasemessageing = FirebaseMessaging;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    inisdemo();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _todaycont.getData(),
      builder: (context, snapshot) {
        
      
        return Scaffold(appBar: AppBar(),body: Container(


          
        ),);
      }
    );
  }





  Future inisdemo()async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification?.body}');
  }
});

  }
}
