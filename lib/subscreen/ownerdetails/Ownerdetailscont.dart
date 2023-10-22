import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerDetailsController extends GetxController{
  RxBool mapSelect= false.obs;
  RxBool numSelect= false.obs;
  RxBool tokenSelect= false.obs;
  TextEditingController numberController = TextEditingController();
  TextEditingController maplongController = TextEditingController();
  TextEditingController maplatController = TextEditingController();
  TextEditingController tokenController = TextEditingController();
  var _firebaseFirestore = FirebaseFirestore.instance;
  var countrycode ;
  var changedSomething = false;




changeSelect(type){
  if (type == 1){
    numSelect.value = true;
  }
  else if (type == 2){
    mapSelect.value = true;
  }
  else{
    tokenSelect.value = true;
  }
}
  getData()async{


    var d = await _firebaseFirestore.collection("accessory").get();
    numberController.text = d.docs.first.data()['Number'].split(" ")[1];
    maplatController.text =   d.docs.first.data()['Map']['Latitude'];
    maplongController.text =  d.docs.first.data()['Map']['Longitude'];
    tokenController.text =  d.docs[1].data()['token'];


  }
  saveChanges()async{
    
    if(changedSomething == false){
      return Get.showSnackbar(GetSnackBar(title: "Alert", message: "No data is changed to save",duration: Duration(seconds: 2),));
    }
    var data = {"Map": {"Latitude" : "${maplatController.text.trim()}",
    "Longitude" : "${maplongController.text.trim()}"} , "Number": "+91 ${numberController.text.trim()}"};
    await _firebaseFirestore.collection("accessory").doc("Owner info").set(data);
    var dt = {"token" : "${tokenController.text.trim()}"};
    await _firebaseFirestore.collection("accessory").doc("Payment").set(dt);
    changedSomething = false;
     Get.showSnackbar(GetSnackBar(title: "Successful", message: "Changes are made successful",duration: Duration(seconds: 2),));
  }

  void ChangeDialog(type) { 
    Get.defaultDialog(
        title: "Warning",
        backgroundColor: Color.fromARGB(255, 217, 217, 217),
        titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        contentPadding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        content: Column(
          children: [
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Warning you are changing the data, Changing the details may effect some features of your app,",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
           
          ],
        ),
        onCancel: () {},
        cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 25)),
            onPressed: () {
              Get.back(closeOverlays: true);
              
            },
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 17, color: Colors.black),
            )),
        confirm: ElevatedButton(
          onPressed: () {
            changeSelect(type);
            Get.back(closeOverlays: true);
            changedSomething = true;
          },
          child: Text(
            "Change",
            style: TextStyle(fontSize: 17),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 25)),
        ),
      );
}}