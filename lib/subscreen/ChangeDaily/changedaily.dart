import 'dart:io';

import 'package:adminpanel/subscreen/ChangeDaily/changedailycont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ChangeDailyData extends StatelessWidget {
  ChangeDailyData({super.key, required this.data , required this.day});
  var data;
  var day;
  var changedatacont = Get.put(ChangeDailyDataController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: changedatacont.getData(data),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.4)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("First image",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87)),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() { 
                            if (changedatacont.isnetfirst.value == false){
                              return Image.file(File(changedatacont.firstimg ,),width: double.infinity,
                            fit: BoxFit.cover,);
                            }
                            return Image.network(
                            changedatacont.firstimg,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ); })
                         ,
                          ElevatedButton(
                              onPressed: () {
                                changedatacont.SelectFilefirst();
                              }, child: Text("Change image")),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            controller: changedatacont.firstcont,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.4)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Second image",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87)),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() {
                            if(changedatacont.isnetsecond.value == false){
                              return Image.file(File(changedatacont.secondimg) ,  width: double.infinity,
                            fit: BoxFit.cover,);
                            }
                            return Image.network(
                            changedatacont.secondimg,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );} )
                          ,
                          ElevatedButton(
                              onPressed: () {
                                 changedatacont.SelectFilesecond();
                              }, child: Text("Change image")),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            controller: changedatacont.secondcont,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.4)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Third image",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87)),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(() { 
                            if(changedatacont.isnetthird.value == false){
                              return Image.file(File(changedatacont.thirdimg),  width: double.infinity,
                            fit: BoxFit.cover,);
                            }
                            return Image.network(
                            changedatacont.thirdimg,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );})
                          ,
                          ElevatedButton(
                              onPressed: () {
                                 changedatacont.SelectFilethied();
                              }, child: Text("Change image")),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            controller: changedatacont.thirdcont,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),


                    ElevatedButton(onPressed: (){
                      changedatacont.saveData(day); 
                    }, child: Text("Save changes"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
