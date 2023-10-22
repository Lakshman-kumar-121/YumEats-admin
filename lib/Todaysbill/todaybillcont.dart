import 'package:adminpanel/Orderview/OrderView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TOdayBillController extends GetxController {
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

  var penwholedata = [];

  

  Future loadpending() async {
    var t = DateTime.now();


    var dte = '${t.day}-${t.month}-${t.year}';
    // '${initdate.day}-${initdate.month}-${initdate.year}';
    var d = await _Firebasedatabase.ref("Daily Order/${dte}/Pending").once();
    if (d.snapshot.value != null) {
      var dat = d.snapshot.value as Map;
      
      var _loop = dat.length;
      penwholedata = dat.keys.toList();
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

  Future getData() async {
        var t = DateTime.now();


    var dte = '${t.day}-${t.month}-${t.year}';
    
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

  changecustref(index) async {
    var d = await _Firebasedatabase.ref(
            'Orders/${penuidlist.elementAt(index)}/Pending')
        .once();
    var dta = d.snapshot.value as Map;
    var updateData = dta[penwholedata.elementAt(index)];
        var t = DateTime.now();


    var dte = '${t.day}-${t.month}-${t.year}';
    await _Firebasedatabase.ref('Daily Order/${dte}/Pending')
        .child(penwholedata.elementAt(index))
        .remove();
    await _Firebasedatabase.ref('Daily Order/${dte}/Orders')
        .update({penwholedata.elementAt(index): ""});
    await _Firebasedatabase.ref('Orders/${penuidlist.elementAt(index)}/Pending')
        .child(penwholedata.elementAt(index))
        .remove();
    await _Firebasedatabase.ref('Orders/${penuidlist.elementAt(index)}/Order')
        .update({penwholedata.elementAt(index): updateData});
    await getData();
  }

  Future orderCancel(index) async {
    var d = await _Firebasedatabase.ref(
            'Orders/${penuidlist.elementAt(index)}/Pending')
        .once();
    var dta = d.snapshot.value as Map;
    var updateData = dta[penwholedata.elementAt(index)];
        var t = DateTime.now();


    var dte = '${t.day}-${t.month}-${t.year}';
    await _Firebasedatabase.ref('Daily Order/${dte}/Pending')
        .child(penwholedata.elementAt(index))
        .remove();
    await _Firebasedatabase.ref('Order cancel/${dte}')
        .update({penwholedata.elementAt(index): ""});
    await _Firebasedatabase.ref('Orders/${penuidlist.elementAt(index)}/Pending')
        .child(penwholedata.elementAt(index))
        .remove();
    await _Firebasedatabase.ref(
            'Orders/${penuidlist.elementAt(index)}/Cancelled')
        .update({penwholedata.elementAt(index): updateData});
  }

  getOrder() async {
        var t = DateTime.now();


    var dte = '${t.day}-${t.month}-${t.year}';
    var d = await _Firebasedatabase.ref('Daily Order').child(dte).once();
    if (d.snapshot.value == null) {
      Get.showSnackbar(GetSnackBar(
        title: "Date out of range",
        message: 'There is no record found at that date , Date is out of range',
        duration: Duration(seconds: 3),
      ));
    }
    getData();
  }

  setComplete(index) async {
    Get.defaultDialog(
        title: "Order Completed",
        content: Text(
          "Are you sure to mark this order as Completed ! ",
        ),
        confirm: ElevatedButton(
            onPressed: () {
              changecustref(index);
            },
            child: Text("Completed")),
        cancel: ElevatedButton(
            onPressed: () {
              Get.back(closeOverlays: true);
            },
            child: Text("Cancel")));
  }

  setdelete() async {
    Get.defaultDialog(
        title: "Warning",
        content: Text(
          "Are you sure to delete this order !\nDeleting an Order is risky which may require payment refund with customer satisfaction and other risk",
        ),
        confirm: ElevatedButton(onPressed: null, child: Text("Delete")),
        cancel: ElevatedButton(
            onPressed: () {
              Get.back(closeOverlays: true);
            },
            child: Text("Cancel")));
  }

  gotoOrderView(uid, index) => Get.to(Orderview(
        cusId: uid.elementAt(index),
        itemlist: itemList.elementAt(index),
        totalprice: pricetotalList.elementAt(index),
      ));

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
