import 'dart:io';

import 'package:adminpanel/Mainscreen/AddCate/Addcatecont.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

class AdditemController extends GetxController {
  var firebasefirestore = FirebaseFirestore.instance;
  var namecont = TextEditingController();
  var discont = TextEditingController();
  var pricecont = TextEditingController();
  RxString Gender = "Available".obs;
  Rx imagefile = "".obs;
  getData(fulldata) {
    
  }
  createitem(category, iscat) async {
    
    if (iscat) {
      var newcat = Get.find<AddCategoryController>();
      newcat.updatedocs();
    }
    if (namecont.text.isNotEmpty &&
        discont.text.isNotEmpty &&
        pricecont.text.isNotEmpty &&
        imagefile.value != "") {
      var url = await uploadImage();
      var itemcategory = {trimvalue(namecont): category};
      await firebasefirestore.collection('demo food').doc(category).set({
        trimvalue(namecont): {
          "Discription": trimvalue(discont),
          "price": int.parse(trimvalue(pricecont)),
          "rating": {"review": {}, "star": {}},
          "img": [
            url == ""
                ? "https://www.nehascookbook.com/wp-content/uploads/2020/07/Paneer-shaak-WS-500x500.jpg"
                : url
          ],
          "status" : Gender.value
        }
      }, SetOptions(merge: true));
      await firebasefirestore
          .collection("demo food")
          .doc("Item Category")
          .set({trimvalue(namecont): category}, SetOptions(merge: true));
      await clearData();
      imagefile.value = "";
      Get.back();
    } else {
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: "Please fill all field",
      ));
    }
  }

  clearData() {
    namecont.text = "";
    discont.text = "";
    pricecont.text = "";
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

  trimvalue(TextEditingController cont) => cont.text.trim();
}
