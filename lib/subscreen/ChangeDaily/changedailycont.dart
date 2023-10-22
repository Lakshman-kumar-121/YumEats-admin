import 'dart:io';

import 'package:adminpanel/Mainscreen/Dailyspecial/dailyspecialont.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class ChangeDailyDataController extends GetxController{
  var firstimg ;
  var secondimg;
  var thirdimg ;

RxBool isnetfirst = true.obs;
RxBool isnetsecond= true.obs;
RxBool isnetthird = true.obs;

  var firstcont = TextEditingController();
  var secondcont = TextEditingController();
  var thirdcont = TextEditingController();
  var firebasefirestore = FirebaseFirestore.instance;
  var firebsestorage = FirebaseStorage.instance;
  getData(data)async{
    firstimg = data.values.elementAt(0);
    secondimg = data.values.elementAt(1);
    thirdimg = data.values.elementAt(2);
    print(data);
    firstcont.text = data.keys.elementAt(0);
    secondcont.text = data.keys.elementAt(1);
    thirdcont.text =  data.keys.elementAt(2);
  }

  Future SelectFilefirst() async {
    var result = await FilePicker.platform.pickFiles(withData: true);  
    if (result == null) return;
    firstimg = result.files.first.path;
    isnetfirst.value = false;
  }
    Future SelectFilesecond() async {
    var result = await FilePicker.platform.pickFiles(withData: true);  
    if (result == null) return;
    secondimg = result.files.first.path;
    isnetsecond.value = false;
  }
    Future SelectFilethied() async {
    var result = await FilePicker.platform.pickFiles(withData: true);  
    if (result == null) return;
    thirdimg = result.files.first.path;
    isnetthird.value = false;
  }
   Future uploadImage(imagefile)async{
    print(imagefile);
    var url = "";
    var name = basename(imagefile);
    final path = 'Accessory/ItemData/Daily Special/${name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    var fsile = File(imagefile);
      try{
      await ref.putFile(fsile );
      url = await ref.getDownloadURL();

      }catch(e){
         Get.showSnackbar(GetSnackBar(title: "Error",message: "Got an Error ${e}",));
      }
      return url;
  }
  
  saveData(day)async{
    var firsturl = isnetfirst.value ?  firstimg : await uploadImage(firstimg)  ;
    var secondurl = isnetsecond.value ? secondimg : await uploadImage(secondimg) ;
    var thirdurl = isnetthird.value ? thirdimg : await uploadImage(thirdimg) ;
    await firebasefirestore.collection("accessory").doc("daily_special").set( { day : [{
      firstcont.text.trim() : firsturl ,
      secondcont.text.trim() : secondurl,
      thirdcont.text.trim() : thirdurl
     }] }, SetOptions(merge: true));
     var dailycont = Get.find<DailySpecialController>();
     await dailycont.getData();
     Get.back();

  }
}