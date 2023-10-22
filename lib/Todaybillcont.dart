import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

final databaseRef = FirebaseDatabase.instance.ref().child("demo");

// Listen to changes in the database
// ignore: use_function_type_syntax_for_parameters



class TodayBillController extends GetxController{
  static final  fluuterlocalNotiplug = FlutterLocalNotificationsPlugin();
  var firebaseDatabase = FirebaseDatabase.instance;
  var totalPrice ;
//   
var  p = databaseRef.onValue.listen((event) {
  // Get the updated data from the DataSnapshot
  var data = event.snapshot.value;
  print("printing bro" );
  print(data);
  shownoti("data", "new body", fluuterlocalNotiplug);

  // Do something with the updated data
});
  

  
  getData()async{

    var d = await firebaseDatabase.ref().child("Daily Order").once();
    var s = d.snapshot.value as Map;
    
    // var p = DateTime.now();
    // var now = "${p.day}-${p.month}-${p.year}";
    var test = "81-3-2023";
    try{
          var len =s[test].length;
    totalPrice = 0;

    for(int x = 0 ; x< len ; x++){
      totalPrice += int.parse( s[test].values.elementAt(x)['price']);
    }
    print(totalPrice);
    }catch(e){
      print("error");
      print(e);
    }

  }}

  Future shownoti(title , body ,fltplugin)async{
try{
  
    AndroidNotificationDetails androidNotificationDetails = 
    new AndroidNotificationDetails('you_can_nameit bew', 'channel_is_name',playSound: true,
    importance: Importance.max
    
    );

    var not = NotificationDetails(android: androidNotificationDetails
    ,);
    await fltplugin.show(0 , title , body , not);
     
}catch(e){
  print("e vro");
  print(e.toString());
}
     
     }