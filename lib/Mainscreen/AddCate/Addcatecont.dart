import 'dart:io';

import 'package:adminpanel/subscreen/Additem/Additem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
class AddCategoryController extends GetxController{
  RxString imagefile = "".obs;
    var catenamecont = TextEditingController();
    var firebasefirestore = FirebaseFirestore.instance;
  Future SelectFile() async {
    var result = await FilePicker.platform.pickFiles(withData: true);  
    if (result == null) return;
    imagefile.value = result.files.first.path ?? "";
  }

  Future uploadImage()async{
    var url = "";
    var name = basename(imagefile.value);
    final path = 'Accessory/ItemData/Category/${name}';
      final ref = FirebaseStorage.instance.ref().child(path);
      var fsile = File(imagefile.value);
      try{
      await ref.putFile(fsile);
      url = await ref.getDownloadURL();
      }catch(e){

         Get.showSnackbar(GetSnackBar(title: "Error",message: "Got an Error ${e}",));
      }
      return url;
  }

  updatedocs()async{
    var url = await uploadImage();  
    await firebasefirestore.collection('demo food').doc("Category").set({catenamecont.text.trim(): url} ,SetOptions(merge: true));
    imagefile.value = "";
  }

  gotoadditem(){
    if(catenamecont.text.isEmpty || imagefile.value == ""){
      Get.showSnackbar(GetSnackBar(title: "Incomplete",message: "Please select Image and fill category field",));
      return;
    }
    return Get.to(()=> AddItem(category: catenamecont.text.trim() ,iscat: true,));
}}