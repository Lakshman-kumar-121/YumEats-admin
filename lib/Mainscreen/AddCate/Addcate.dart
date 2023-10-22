import 'dart:io';

import 'package:adminpanel/Mainscreen/AddCate/Addcatecont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class AddCategory extends StatelessWidget {
   AddCategory({super.key});
   var addcatecont = Get.put(AddCategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
      child:Column(children: [
        Obx(() {
          if (addcatecont.imagefile.value == ""){return Image.network("https://www.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg" ,width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height* 0.2 , );
          }
          return Image.file(File(addcatecont.imagefile.value),width: MediaQuery.of(context).size.width * 0.9 ,height: MediaQuery.of(context).size.height* 0.2,);
        
        } ),

        ElevatedButton(onPressed: (){
          addcatecont.SelectFile();
        }, child: Text("Select image")),
        
        TextField(
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  controller: addcatecont.catenamecont,
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
                    labelText: 'Category Name',
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  addcatecont.gotoadditem();
                }, child: Text("Add item"))
      ],),
    ),);
  }
}