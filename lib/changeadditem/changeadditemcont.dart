import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';


class ChangeAddItemController extends GetxController{
  Rx imagefile = "".obs;
  var firebasefirestore = FirebaseFirestore.instance;
   var namecont = TextEditingController();
     var discont = TextEditingController();
  var pricecont = TextEditingController();
  RxString Gender = "Available".obs;

  getDatas(itemname , category)async{
    print(itemname);
    print(category);
    var d = await firebasefirestore.collection("Food").doc(category).get();
    var dat = d.data()?[itemname];
    namecont.text = itemname;
    discont.text = dat["Discription"];
    pricecont.text = dat["price"].toString();
    // Gender.value = dat["status"];
    // imagefile.value = dat['img'];
  }
    Future SelectFile() async {
    var result = await FilePicker.platform.pickFiles(withData: true);
    if (result == null) return;
    imagefile.value = result.files.first.path;
  }

  Future uploadImage() async {
    var url = "";
    var name = basename(imagefile.value);
    final path = 'Accessory/ItemData/Items/${name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    var fsile = File(imagefile.value);
    try {
      await ref.putFile(fsile);
      url = await ref.getDownloadURL();
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: "Got an Error ${e}",
      ));
    }
    return url;
  }
  changedata(name)async{
    var s = await firebasefirestore.collection("demo food").doc("North Indian").get();
    var data = s.data()?[name];
    data["Discription"] = trimvalue(discont);
    data["price"] = int.parse( trimvalue(pricecont)) ;
    data["status"] = Gender.value;
    if(imagefile.value != ""){
          var url = await uploadImage();
    data["img"] =  url;
    }
    await firebasefirestore.collection("demo food").doc("North Indian").set({name: FieldValue.delete()},SetOptions(merge: true));
    var d = await firebasefirestore.collection("demo food").doc("North Indian").set({ trimvalue(namecont): data },SetOptions(merge: true));
  }
  trimvalue(TextEditingController cont) => cont.text.trim();
}