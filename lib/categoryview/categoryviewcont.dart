import 'package:adminpanel/changeadditem/changeadditem.dart';
import 'package:adminpanel/itemedit/itemedit.dart';
import 'package:adminpanel/subscreen/Additem/Additem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryViewController extends GetxController {
  var firebaseFirestore = FirebaseFirestore.instance;
  var imagelist = [];
  var namelist;
  var listlen = 0;
  var pricelist = [];
  var rate = [];
  var items = [];
  var fulldata;
  getData(category) async {
    clearData();
    var d = await firebaseFirestore.collection('Food').doc(category).get();
    var data = d.data();
    namelist = data?.keys;
    listlen = namelist.length;
    imagelist.length = listlen;
    pricelist.length = listlen;
    rate.length = listlen;
    items.length = listlen;

    for (int x = 0; x < listlen; x++) {
      var ds = data?[namelist.elementAt(x)];
      imagelist.insert(x, ds['img'].elementAt(0));
      pricelist.insert(x, ds['price']);
      var rt = ds['rating']['star'].values;
      rate.insert(x, rt.reduce((a, b) => a + b) / rt.length);
    }
  }

  clearData() {
    imagelist.clear();

    pricelist.clear();
    rate.clear();
    items.clear();
  }

  gotoadditem(category) => Get.to(() => AddItem(
        category: category,
        iscat: false,
      ));

  removedata(category, index) async {
    var itemnme = namelist.elementAt(index);
    await firebaseFirestore
        .collection("Food")
        .doc(category)
        .set({itemnme: FieldValue.delete()}, SetOptions(merge: true));
  }

  remove(category, index) => Get.defaultDialog(
          title: "Warning!!",
          titleStyle: TextStyle(color: Colors.redAccent),
          middleText:
              "Are you sure you want to complete remove this item. This item deleted once cannot be recovered.\n Warning!! Deleting the data can lead to app functional issues ",
          actions: [
            ElevatedButton(
                onPressed: () {
                  removedata(category, index);
                },
                child: Text("Confirm")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel")),
          ]);
  gotoedit(context, category, itemname) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ChangeAddItem(itemname: itemname, category: category),
      ));

  gotoviewitem(context, cate, itenma) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditItem(
                category: cate,
                itemname: itenma,
              )));
}
