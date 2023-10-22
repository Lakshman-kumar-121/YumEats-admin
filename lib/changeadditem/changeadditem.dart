import 'dart:io';

import 'package:adminpanel/changeadditem/changeadditemcont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ChangeAddItem extends StatelessWidget {
  ChangeAddItem({super.key , required this.itemname , required this.category});
  var itemname;
  var category;
  var changeaddcont = Get.put(ChangeAddItemController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: changeaddcont.getDatas(itemname,category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        return Scaffold(
          appBar: AppBar(title: Text("fe"),),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Container(child: Obx(() =>  Row(
                    children: [
                      changeaddcont.imagefile.value == "" ? Image.network("https://www.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg" ,width: MediaQuery.of(context).size.width * 0.3,):
                      Image.file(File(changeaddcont.imagefile.value) ,width: MediaQuery.of(context).size.width * 0.3 ,)
                    ],
                  )),),
                  ElevatedButton(onPressed: (){
                    changeaddcont.SelectFile();
                  }, child: Text("select file")),
                  TextField(
                    
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    controller:changeaddcont.namecont,
                    decoration: InputDecoration(
                      
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      labelText: 'Item name',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextField(
          
                    maxLength: 250,
                      keyboardType: TextInputType.multiline,
            minLines: 1, maxLines: 5, 
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    controller: changeaddcont.discont,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      labelText: 'Discrption',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextField(
                    
                      keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    controller: changeaddcont.pricecont,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.currency_rupee,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                      labelText: 'Price',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Status"),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1.5)),
                                  child: DropdownButtonHideUnderline(
                                    child: Obx(() =>DropdownButton(
                                        value: changeaddcont.Gender.value,
                                        items: Dropmenufunc(),
                                        onChanged: (value) {
                                            changeaddcont.Gender.value = value.toString();
                                            
                                         
                                        }))
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    changeaddcont.changedata("paneer");
                  }, child: Text("Change data"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
    Dropmenufunc() {
    return [
      DropdownMenuItem(
        child: Text("Available"),
        value: "Available",
      ),
      DropdownMenuItem(
        child: Text("Not Available"),
        value: "Not Available",
      )
    ];
  }
}