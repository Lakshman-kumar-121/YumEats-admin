import 'package:adminpanel/Daywise/Daywisecont.dart';
import 'package:adminpanel/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Daywise extends StatelessWidget {
  Daywise({super.key});

  final daywisecont = Get.put(DaywiseController());
  var w;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width / 2.8;
    
    return FutureBuilder(
        future: daywisecont.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 242, 195),
                          borderRadius: BorderRadius.circular(20)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Date : ${daywisecont.initdate.day} - ${daywisecont.initdate.month} - ${daywisecont.initdate.year}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            IconButton(
                              onPressed: () {
                                daywisecont.pickdate(context);
                              },
                              icon: Icon(
                                Icons.edit_calendar_outlined,
                                size: 30,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            IconButton(
                              onPressed: () {
                                print("hello");
                                daywisecont.getOrder();
                              },
                              icon: Icon(
                                Icons.search,
                                size: 30,
                              ),
                              padding: EdgeInsets.zero,
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Pending"),
                    penlist(),
                    Text("Completed"),
                    list()
                  ],
                ),
              ),
            ),
          );
        });
  }

  penlist() => Obx(() {
        if (daywisecont.listlen == 0) return Text('Loading');
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: daywisecont.penlistlen.value,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              daywisecont.gotoOrderView(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ph No : ${daywisecont.pennumberList.elementAt(index)}"),
                  Text("Time : ${daywisecont.pentimelist.elementAt(index)}"),
                  Text(
                      "Total price : ${daywisecont.penpricetotalList.elementAt(index)}"),
                  Text("Items : "),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Item name"),
                        Text("Category  "),
                        Text("   Qnt   ")
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    child: penitmlist(index),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // daywisecont.chageascomp(index);
                            // daywisecont.changecustref(index);
                            // daywisecont.setComplete();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.check),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Completed")
                            ],
                          )),
                      ElevatedButton(
                          onPressed: () {
                            // daywisecont.orderCancel(index);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.check),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Delete")
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });

  list() => Obx(() {
        if (daywisecont.listlen == 0) return Text('Loading');
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: daywisecont.listlen.value,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              daywisecont.gotoOrderView(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ph No : ${daywisecont.numberList.elementAt(index)}"),
                  Text("Time : ${daywisecont.timelist.elementAt(index)}"),
                  Text(
                      "Total price : ${daywisecont.pricetotalList.elementAt(index)}"),
                  Text("Items : "),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Item name"),
                        Text("Category  "),
                        Text("   Qnt   ")
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    child: itmlist(index),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ],
              ),
            ),
          ),
        );
      });

  penitmlist(idx) => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: daywisecont.penitemList.elementAt(idx).length,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                width: w - 20,
                child: Text(
                  "${daywisecont.penitemList.elementAt(idx).keys.elementAt(index)}",
                )),
            Container(
                width: w - 20,
                child: Text(
                    "${daywisecont.penitemList.elementAt(idx).values.elementAt(index)['Category']}")),
            Container(
                width: w / 2 - 20,
                child: Text(
                    "${daywisecont.penitemList.elementAt(idx).values.elementAt(index)['Quantity']}",
                    textAlign: TextAlign.center))
          ],
        ),
      );

  itmlist(idx) => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: daywisecont.itemList.elementAt(idx).length,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                width: w - 20,
                child: Text(
                  "${daywisecont.itemList.elementAt(idx).keys.elementAt(index)}",
                )),
            Container(
                width: w - 20,
                child: Text(
                    "${daywisecont.itemList.elementAt(idx).values.elementAt(index)['Category']}")),
            Container(
                width: w / 2 - 20,
                child: Text(
                    "${daywisecont.itemList.elementAt(idx).values.elementAt(index)['Quantity']}",
                    textAlign: TextAlign.center))
          ],
        ),
      );
}
