import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();

} 
var fluuterlocalNotiplug = FlutterLocalNotificationsPlugin();
class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize(fluuterlocalNotiplug);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: ElevatedButton(onPressed: (){
        shownoti("hello broagain " , "body bro sorry" , fluuterlocalNotiplug);
      }, child: Text("Notification")),
    ),);
  }

   Future shownoti(title , body ,fltplugin)async{
    AndroidNotificationDetails androidNotificationDetails = 
    new AndroidNotificationDetails('you_can_nameit bew', 'channel_is_name',playSound: true,
    importance: Importance.max
    
    );

    var not = NotificationDetails(android: androidNotificationDetails
    ,);
    await fltplugin.show(0 , title , body , not);
//   var time = DateTime.now().add(Duration(seconds: 10));
  
//       final location = await timeZone.getLocation(timeZoneName);

//     final scheduledDate = tz.TZDateTime.from(time, location);
// await fltplugin.zonedSchedule(0 , title , body , tz.TZDateTime.from(time, tz.local), not 
// ,androidAllowWhileIdle:true,uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime );
// print("Added date bro");

}
static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin)async{
  var androidInitialize = new AndroidInitializationSettings('mipmap/ic_launcher');
  var initializationSetting = new InitializationSettings(android: androidInitialize);
  await flutterLocalNotificationsPlugin.initialize(initializationSetting);
}
}