import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SingleUserController extends GetxController{
  var firebasefirestore = FirebaseFirestore.instance;
  var uid;
  var photourl ;
  var name;
  var email;
  var address;
  var number;
  var gender;
  var skey;
  var streakcount;
  var favitem;
  var favcat;

  var favlen;
  getData(uid , data){
    uid = uid;
    photourl = data["Personaldata"]["Photo"];
    name  =data["Personaldata"]["Name"];
    email = data["Personaldata"]["Email"];
    number = data["Personaldata"]["Number"];
    address = data["Personaldata"]["Address"];
    gender = data["Personaldata"]["Gender"];
    skey = data["Personaldata"]["StripeId"];
    uid = data["Personaldata"]["UID"];
    
    favitem = data["fav"].keys;
    favlen = favitem.length;
    favcat = data["fav"].values; 
  }
}