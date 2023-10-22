import 'package:adminpanel/Orderview/OrderView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaywiseController extends GetxController {
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

  var initdate = DateTime.now();
  var firstdate = DateTime(2000, 02, 02);
  var lastdate = DateTime(2100, 02, 02);

  Future loadpending() async {
    
    var dte =
        '${initdate.day}-${initdate.month}-${initdate.year}';
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
        '${initdate.day}-${initdate.month}-${initdate.year}';
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

  chageascomp(index) async {
    var dte =
        '${initdate.day}-${initdate.month}-${initdate.year}';
    var e = await _Firebasedatabase.ref(
            'Daily Order/${dte}/Pending/${uidlist.elementAt(index)}')
        .once();
    var data = {};
    if (e.snapshot.value == null) {
      data[0] = refId.elementAt(index);
    } else {
      var b = e.snapshot.value as List;
      for (int i = 0; i < b.length; i++) {
        data[i] = b.elementAt(i);
      }
      data[b.length] = '${refId.elementAt(index)}';
    }
    await _Firebasedatabase.ref(
            'Daily Order/${dte}/Orders/${uidlist.elementAt(index)}/')
        .set(data);
  }

  

  pickdate(context) async {
    DateTime? newdate = await showDatePicker(
        context: context,
        initialDate: initdate,
        firstDate: firstdate,
        lastDate: lastdate);
    if (newdate != null) {
      initdate = newdate;
    }
  }

  getOrder() async {
    var dte =
        '${initdate.day}-${initdate.month}-${initdate.year}';
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

  setComplete() async {
    Get.defaultDialog(
        title: "Order Completed",
        content: Text(
          "Are you sure to mark this order as Completed ! ",
        ),
        confirm: ElevatedButton(onPressed: null, child: Text("Completed")),
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

  gotoOrderView(index) => Get.to(Orderview(
        cusId: 'demo',
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
