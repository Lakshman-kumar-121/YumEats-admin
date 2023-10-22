import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderViewController extends GetxController{
  var firebasefirestore = FirebaseFirestore.instance;
  var ImageUrl;
  var Email;
  var Name;
  var Number;
  var Address;
  var Orderdate;
  getdata(cusid)async{

    var d = await firebasefirestore.collection('users').doc(cusid).get();
    var dat = d.data()?['Personaldata'];
    Name = dat['Name'];
    ImageUrl = dat['Photo'];
    Email = dat['Email'];
   Number = dat['Number'];
   Address = dat['Address'];
  }
  
}