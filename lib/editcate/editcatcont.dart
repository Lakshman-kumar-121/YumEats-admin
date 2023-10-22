import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class EditCategoryController extends GetxController {
  var Name = TextEditingController();
  Rx imagefile = "https://t4.ftcdn.net/jpg/02/75/39/23/360_F_275392381_9upAWW5Rdsa4UE0CV6gRu2CwUETjzbKy.jpg".obs;
  var firebasefirestore = FirebaseFirestore.instance; 
  
  RxBool onlineimg = true.obs;

  Future changeurl(nme)async{
    var url = await uploadImage();
    await firebasefirestore.collection("demo food").doc("Category").set({nme: url} ,SetOptions(merge: true));
  }
  savechanges(name){
      Get.defaultDialog(title: "Warning!!" ,middleText: "Are you sure to update the Category image",actions: [
      ElevatedButton(onPressed: (){
       changeurl(name);
       Get.back();
      }, child:Text("Yes")),
      ElevatedButton(onPressed: (){
        Get.back();
      }, child:Text("NO"))

    ]);
  }
  removecate(name)async{
    var mp = {};
    await firebasefirestore.collection("demo food").doc(name).delete();
    await firebasefirestore.collection('demo food').doc("Category").set({name:FieldValue.delete()},SetOptions(merge: true));
    var d = await firebasefirestore.collection("demo food").doc("Item Category").get();
    if(d.data() != null){
      var len = d.data()!.length;
      var data = d.data();
      var val = data?.values;
      var keys = data!.keys ;
      for(int i = 0 ; i< len ; i++){
        if(val!.elementAt(i) == name){
          await firebasefirestore.collection("demo food").doc("Item Category").set({ keys.elementAt(i): FieldValue.delete()}, SetOptions(merge: true));
        }
      }
    }
  }
  deletedialog(name){
    Get.defaultDialog(title: "Severe Warning!!" ,middleText: "Deleting this category can lead to malfunction of your App,",actions: [
      ElevatedButton(onPressed: (){
        removecate(name);
        Get.back();
      }, child:Text("Yes")),
      ElevatedButton(onPressed: (){
        Get.back();
      }, child:Text("NO"))

    ]);

    // await firebasefirestore.collection("demo food").doc("hh").delete();
  }
  getData(catename)async{
    Name.text = catename;
    var d = await firebasefirestore.collection("demo food").doc("Category").get();
    var data = d.data();
    
    if(data?[catename]!= null){
imagefile.value = data?[catename];
    }
  }

  Future SelectFile() async {
    var result = await FilePicker.platform.pickFiles(withData: true);
    if (result == null) return;
    imagefile.value = result.files.first.path ?? "";
    onlineimg.value = false;
  }

  Future uploadImage() async {
    var url = "";
    var name = basename(imagefile.value);
    final path = 'Accessory/CategoryData/Images/${name}';
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


}
