import 'dart:io';

import 'package:adminpanel/editcate/editcatcont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class EditCategory extends StatelessWidget {
 EditCategory({super.key , required this.categoryname});
 var categoryname;
 var editcatecont = Get.put(EditCategoryController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: editcatecont.getData(categoryname),
      builder: (context, snapshot) {
      
      if(snapshot.connectionState == ConnectionState.waiting)return CircularProgressIndicator();
      return Scaffold(
        appBar: AppBar(title: Text("Change category"),),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    minimumSize: Size(200, 50)
                  ),
                  onPressed: (){
                  editcatecont.deletedialog(categoryname);
                }, child: Text("Remove item" , style: TextStyle(fontSize: 18),)),
                SizedBox(height: 10,),
                ClipRRect(

                  borderRadius: BorderRadius.circular(25),
                  child: Stack(
                    children: [
                      Obx(() {
                        if(editcatecont.onlineimg.value){
                return Image.network('https://t4.ftcdn.net/jpg/02/75/39/23/360_F_275392381_9upAWW5Rdsa4UE0CV6gRu2CwUETjzbKy.jpg',width: 300,height: 300 ,fit: BoxFit.cover,);
                          // return Image.network( editcatecont.imagefile.value ,width: 300,height: 300 ,fit: BoxFit.cover,);
                        }
                        return Image.file( File(editcatecont.imagefile.value) ,width: 300, height: 300, fit: BoxFit.cover,);
                      } 
                        ),
                      Positioned(child: Container(
                        decoration: BoxDecoration(color: Colors.white ,borderRadius: BorderRadius.circular(30)),
                        child: IconButton(onPressed: (){
                          editcatecont.SelectFile();  
                        }, icon: Icon(Icons.camera , color: Colors.black, size: 35, ),padding: EdgeInsets.zero,)) ,right: 0, bottom: 0,)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
               
              TextField(
                        controller: editcatecont.Name,
                        
                        enabled: false,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: "Name",
                                labelStyle: TextStyle(color: Colors.black),
                                suffixIcon:  Icon(
                                      Icons.food_bank,
                                      size: 30,
                                    )),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    minimumSize: Size(200, 50)
                  ),
                            onPressed: (){
                            editcatecont.savechanges("${editcatecont.Name.text}");
                          }, child: Text("Save changes" , style: TextStyle(fontSize: 18),)),
                          

              ],
            ),
          ),
        ),
      );
    },);
  }
}