import 'package:adminpanel/Orderview/OrderView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCancelController extends GetxController{
  final _Firebasedatabase = FirebaseDatabase.instance;
  RxInt listlen = 0.obs;
  var timelist = [];
  var numberList = [];
  var pricetotalList = [];
  var uidlist = [];
  var itemList = [];
  var refId = [];


  Rx initdate = DateTime.now().obs;
  var firstdate = DateTime(2000, 02, 02);
  var lastdate = DateTime(2100, 02, 02);


    pickdate(context) async {
    DateTime? newdate = await showDatePicker(
        context: context,
        initialDate: initdate.value,
        firstDate: firstdate,
        lastDate: lastdate);
    if (newdate != null) {
      initdate.value = newdate;
    }
  }
  
  Future getData() async {
    var d = await _Firebasedatabase.ref("Order cancel/${initdate.value.day}-${initdate.value.month}-${initdate.value.year}").once();
    if (d.snapshot.value != null) {
      var dat = d.snapshot.value as Map;
      var _loop = dat.length;
      var wholedata = dat.keys.toList();
      wholedata. sort();
      var f;
      cleardata();
      for (int x = 0; x < _loop; x++) {
          print(wholedata.elementAt(x));
          var spli = wholedata.elementAt(x).split("::");
          uidlist.add(spli[1]);
          refId.add(spli[2]);
          
          f = await _Firebasedatabase.ref("Orders")
              .child(uidlist.elementAt(x))
              .child("Cancelled")
              .child(wholedata.elementAt(x))
              .once();
          var temp = f.snapshot.value;
          
          pricetotalList.add(temp['Price total']);
          itemList.add(temp['Items']);
          timelist.add(temp['Time'].toString().split(" ").elementAt(0));
          numberList.add(temp['Number']);
        

      }
     
      listlen.value = _loop;
    } else {
      listlen.value = 0;
    }
    
    
  }
    gotoOrderView(index) => Get.to(Orderview(
        cusId: 'demo',
        itemlist: itemList.elementAt(index),
        totalprice: pricetotalList.elementAt(index),
      ));

  cleardata() {    
    refId.clear();
    listlen.value = 0;
    numberList.clear();
    uidlist.clear();
    timelist.clear();
    itemList.clear();
    pricetotalList.clear();
  }
}