import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ItemEditContrlller extends GetxController {
  var firebasefirestore = FirebaseFirestore.instance;
  var imageurl = "";
  var itemname;
  var discription;
  var price;
  var status;

  var uidlist ;
  var namelist = [];
  var starlist ;
  var datelist = [];
  var reviewlist = [];
  var lenlis = 0;

  Future getData(category , name )async {
    var d = await firebasefirestore.collection("Food").doc(category).get();
    var alldata  = d.data()?[name];
    itemname = name;
    imageurl = alldata['img'].elementAt(0);
    discription = alldata['Discription'];
    status = alldata['status'];
    price = alldata['price'];
    print(alldata['rating']['star'].values);
    starlist = alldata['rating']['star'].values;
    uidlist = alldata['rating']['star'].keys;

lenlis = starlist.length;
    for(int i = 0 ; i< lenlis ; i++){
      namelist.add(alldata['rating']['review'][uidlist.elementAt(i)]['name']);
      reviewlist.add(alldata['rating']['review'][uidlist.elementAt(i)]['discription']);
      var dte = alldata['rating']['review'][uidlist.elementAt(i)]['time'];
      datelist.add(   DateTime.fromMillisecondsSinceEpoch(dte.seconds * 1000).toString().split(".")[0]);

    }
  }
}
