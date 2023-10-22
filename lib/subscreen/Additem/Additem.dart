import 'dart:io';

import 'package:adminpanel/subscreen/Additem/Additemcont.dart';
import 'package:adminpanel/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class AddItem extends StatelessWidget {
  AddItem({super.key, required this.category , required this.iscat});
  var iscat ;
  var category;
  var additemcont = Get.put(AdditemController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: additemcont.getData(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        return Scaffold(
          appBar: AppBar(title: Text("New item"),),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Obx(() =>  Row(
                    children: [
                      additemcont.imagefile.value == "" ? Image.network("https://www.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg" ,width: MediaQuery.of(context).size.width * 0.3,):
                      Image.file(File(additemcont.imagefile.value) ,width: MediaQuery.of(context).size.width * 0.88 ,)
                    ],
                  )),),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(),
                    minimumSize: Size(200,50)),
                    onPressed: (){
                    additemcont.SelectFile();
                  }, child: Text("Select file" , style: TextStyle(fontSize: 18),)),
                  SizedBox(height: 10,),
                  TextField(
                    
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    controller:additemcont.namecont,
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
                    controller: additemcont.discont,
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
                    controller: additemcont.pricecont,
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
                      labelText: 'Price',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 10,),
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
                                          value: additemcont.Gender.value,
                                          items: Dropmenufunc(),
                                          onChanged: (value) {
                                              additemcont.Gender.value = value.toString();
                                              
                                           
                                          }))
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: StadiumBorder(),
                    minimumSize: Size(200,50)),
                    onPressed: (){
                    additemcont.createitem(category , iscat);
                  }, child: Text("Add Item" , style: TextStyle(fontSize: 18),))
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
