import 'dart:convert';
import 'dart:io';

import 'package:adminpanel/Orderview/OrderView.dart';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class PastdataController extends GetxController{
var initdate = DateTime.now().obs; 
    var firstdate = DateTime(2000, 02, 02);
  var lastdate = DateTime(2100, 02, 02);


    final _Firebasedatabase = FirebaseDatabase.instance;
  var firebasefirestore = FirebaseFirestore.instance;
  RxInt listlen = 0.obs;
  var timelist = [];
  var numberList = [];
  var pricetotalList = [];
  var uidlist = [];
  var itemList = [];
  var refId = [];

  RxInt penlistlen = 0.obs;
  var pentimelist = [];
  var pennumberList = [];
  var penpricetotalList = [];
  var penuidlist = [];
  var penitemList = [];
  var penrefId = [];


save() async {
     
         var d =
        await _Firebasedatabase.ref("")
            .once() ;
    var data =  d.snapshot.value as Map;

    

String jsonString = json.encode(data);
     
        try{
           final directory = await AndroidPathProvider.downloadsPath;
           
           var direx = await Directory('${directory}/Adminpanel').exists();
           if (! direx){
            await Directory('${directory}/Adminpanel').create();
           }
           var tim = DateTime.now();
  final file = File('${directory}/Adminpanel/${tim.year}-${tim.month}-${tim.day}-${tim.second}.json');
 await file.writeAsString(jsonString);
    
    
    final path = 'Accessory/Backup/${tim.year}-${tim.month}-${tim.day}-${tim.second}.json';
    final ref = FirebaseStorage.instance.ref().child(path);
    var fsile = File(file.path);
    try {
      await ref.putFile(fsile);
      Get.showSnackbar(GetSnackBar(
        title: "Sucessful",
        message: "Backup process sucessful",
      ));
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: "Got an Error ${e}",
      ));
    }
        }
        catch(es){
          Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: "Got an Error ${es}",
      ));
        }
   
}


  changecustref(index) async {
    var d =
        await _Firebasedatabase.ref('Orders/${uidlist.elementAt(index)}/Orders')
            .once();
    var dta = d.snapshot.value as Map;
    var updateData = dta[refId.elementAt(index)];

    
    await _Firebasedatabase.ref('Orders/${uidlist.elementAt(index)}/Pending')
        .update({refId.elementAt(index): updateData});
  }

  orderCancel(index) async {
    var d =
        await _Firebasedatabase.ref('Orders/${uidlist.elementAt(index)}/Orders')
            .once();
    var s = d.snapshot.value as Map;
    s = s[refId.elementAt(index)];
    var dta = {
      '10-20-2023': {
        uidlist.elementAt(index): {refId.elementAt(index): s}
      }
    };
    await _Firebasedatabase.ref('Order cancel').update(dta);
  }
  
  gotoOrderView(index) => Get.to(Orderview(
        cusId: uidlist.elementAt(index),
        itemlist: itemList.elementAt(index),
        totalprice: pricetotalList.elementAt(index),
      ));
      
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
    getOrder() async {
      print("ran this");
    var dte =
        '${initdate.value.day}-${initdate.value.month}-${initdate.value.year}';
    var d = await _Firebasedatabase.ref('Daily Order').child(dte).once();
    if (d.snapshot.value == null) {
      Get.showSnackbar(GetSnackBar(
        title: "No Data",
        message: 'There is no record found at that date ',
        duration: Duration(seconds: 3),
      ));
    }
    getData();
  }

  
  Future loadpending() async {
    
    var dte =
        '${initdate.value. day}-${initdate.value.month}-${initdate.value.year}';
    var d = await _Firebasedatabase.ref("Daily Order/${dte}/Pending").once();

    if (d.snapshot.value != null) {
      var dat = d.snapshot.value as Map;
      var _loop = dat.length;

      var penwholedata = dat.keys.toList();
      penwholedata.sort();

      var f;
      cleardata();

      for (int x = 0; x < _loop; x++) {
        var spli = penwholedata.elementAt(x).split("::");

        penuidlist.add(spli[1]);

        penrefId.add(spli[2]);
        f = await _Firebasedatabase.ref("Orders")
            .child(penuidlist.elementAt(x))
            .child("Pending")
            .child(penwholedata.elementAt(x))
            .once();
        var temp = f.snapshot.value;
        penpricetotalList.add(temp['Price total']);
        penitemList.add(temp['Items']);
        pentimelist.add(temp['Time'].toString().split(" ").elementAt(0));
        pennumberList.add(temp['Number']);
      }

      penlistlen.value = _loop;
    } else {
      penlistlen.value = 0;
    }
  }

  getData() async {
   
    var dte =
        '${initdate.value.day}-${initdate.value.month}-${initdate.value.year}';
    var d = await _Firebasedatabase.ref("Daily Order/${dte}/Orders").once();
    if (d.snapshot.value != null) {
      var dat = d.snapshot.value as Map;
      var _loop = dat.length;
      var wholedata = dat.keys.toList();
      wholedata.sort();
      var f;
      cleardata();
      await loadpending();
      for (int x = 0; x < _loop; x++) {
        print(wholedata.elementAt(x));
        var spli = wholedata.elementAt(x).split("::");
        uidlist.add(spli[1]);
        refId.add(spli[2]);

        f = await _Firebasedatabase.ref("Orders")
            .child(uidlist.elementAt(x))
            .child("Order")
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
    cleardata() {
    penrefId.clear();
    penlistlen.value = 0;
    pennumberList.clear();
    penuidlist.clear();
    pentimelist.clear();
    penitemList.clear();
    penpricetotalList.clear();

    refId.clear();
    listlen.value = 0;
    numberList.clear();
    uidlist.clear();
    timelist.clear();
    itemList.clear();
    pricetotalList.clear();
  }

}