import 'package:adminpanel/subscreen/feedback/fdbackcont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Fdback extends StatelessWidget {  
   Fdback({super.key});
  var _fdbackcont = Get.put(fdBackController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  _fdbackcont.getData(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)return CircularProgressIndicator();
        return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: Text("Feedback" , style: TextStyle(color: Colors.black ,fontSize: 28 , fontWeight: FontWeight.w600)),
                  backgroundColor: Colors.transparent,
                ),
                body: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(thickness: 2),
                            
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _fdbackcont.length,
                              itemBuilder: (context, index) => reviewList(index),),
                              SizedBox(height: 80,),
                            
                           
                          ]),
                    )),
                );
      }
    );
  }
  reviewList(index) => Container(
    margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 239, 239, 239)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_fdbackcont.nameList.elementAt(index)}",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Divider(
                                thickness: 1.1,
                              ),
                              Text(
                                "${_fdbackcont.discpList.elementAt(index)}",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Id : "),
                                  Expanded(child: Text("")),
                                  Icon(
                                    Icons.person_2_rounded,
                                    color: Colors.black54,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_fdbackcont.idList.elementAt(index)}",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                  Expanded(child: Text("")),
                                  Icon(
                                    Icons.edit,
                                    color: Colors.black54,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${_fdbackcont.timeList.elementAt(index)}",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  )
                                ],
                              ),
                              
                            ],
                          ),
                        );

}