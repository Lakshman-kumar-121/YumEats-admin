
import 'package:adminpanel/Categoryselect/categoryselect.dart';
import 'package:adminpanel/Mainscreen/Dailyspecial/DailySpeical.dart';
import 'package:adminpanel/Daywise/daywise.dart';
import 'package:adminpanel/Navigator.dart';
import 'package:adminpanel/subscreen/Ordercancel/ordercancel.dart';
import 'package:adminpanel/Orderview/OrderView.dart';
import 'package:adminpanel/Orderview/datepick/datepick.dart';
import 'package:adminpanel/subscreen/ownerdetails/Ownerdetails.dart';
import 'package:adminpanel/Testnoti/testnoti.dart';
import 'package:adminpanel/subscreen/feedback/fdback.dart';
import 'package:adminpanel/today.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Background msg bro");
  print("Handling a background message: ${message.messageId}");
}

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const App());
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {  

    return GetMaterialApp(
      home: 
      Navigationbar()
      // CategorySelect()
      // OrderCancel()
      // Datepicker() 
      // Orderview(cusId: 'asd', otherdata: 'ad',) 
      // Daywise(),
    );
  }

 
}
