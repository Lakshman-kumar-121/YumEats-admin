import 'package:adminpanel/checkcont.dart';
import 'package:adminpanel/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pastdata extends StatelessWidget {
  Pastdata({super.key});
  var pastdatacont = Get.put(PastdataController());
var w;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width / 2.8;
    return FutureBuilder(
        future: pastdatacont.getData(),
        builder: (context, snapshot) {
        return   
          Scaffold(
      appBar: AppBar(title: Text("Orders"),),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15 ,vertical: 10),
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
                            
 Obx(() => Text(
                  "Date : ${pastdatacont.initdate.value.day} - ${pastdatacont.initdate.value.month} - ${pastdatacont.initdate.value.year}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                )),

                            IconButton(
                              onPressed: () {
                                pastdatacont.pickdate(context);
                              },
                              icon: Icon(
                                Icons.edit_calendar_outlined,
                                size: 30,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            IconButton(
                              onPressed: () {
                                
                                pastdatacont.getOrder();
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
                    ElevatedButton(onPressed: (){
                      print("hello");
                      pastdatacont.save();
                    }, child: Text('Download record')),
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
    );});
  }
    penlist() => Obx(() {
        if (pastdatacont.listlen == 0) return Text('Loading');
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pastdatacont.penlistlen.value,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              pastdatacont.gotoOrderView(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ph No : ${pastdatacont.pennumberList.elementAt(index)}"),
                  Text("Time : ${pastdatacont.pentimelist.elementAt(index)}"),
                  Text(
                      "Total price : ${pastdatacont.penpricetotalList.elementAt(index)}"),
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
                            
                            pastdatacont.changecustref(index);
                            
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
                            pastdatacont.orderCancel(index);
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
        if (pastdatacont.listlen == 0) return Text('Loading');
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pastdatacont.listlen.value,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              pastdatacont.gotoOrderView(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ph No : ${pastdatacont.numberList.elementAt(index)}"),
                  Text("Time : ${pastdatacont.timelist.elementAt(index)}"),
                  Text(
                      "Total price : ${pastdatacont.pricetotalList.elementAt(index)}"),
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
        itemCount: pastdatacont.penitemList.elementAt(idx).length,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                width: w - 20,
                child: Text(
                  "${pastdatacont.penitemList.elementAt(idx).keys.elementAt(index)}",
                )),
            Container(
                width: w - 20,
                child: Text(
                    "${pastdatacont.penitemList.elementAt(idx).values.elementAt(index)['Category']}")),
            Container(
                width: w / 2 - 20,
                child: Text(
                    "${pastdatacont.penitemList.elementAt(idx).values.elementAt(index)['Quantity']}",
                    textAlign: TextAlign.center))
          ],
        ),
      );
      itmlist(idx) => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: pastdatacont.itemList.elementAt(idx).length,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                width: w - 20,
                child: Text(
                  "${pastdatacont.itemList.elementAt(idx).keys.elementAt(index)}",
                )),
            Container(
                width: w - 20,
                child: Text(
                    "${pastdatacont.itemList.elementAt(idx).values.elementAt(index)['Category']}")),
            Container(
                width: w / 2 - 20,
                child: Text(
                    "${pastdatacont.itemList.elementAt(idx).values.elementAt(index)['Quantity']}",
                    textAlign: TextAlign.center))
          ],
        ),
      );

}
