import 'package:adminpanel/Todaysbill/todaybillcont.dart';
import 'package:adminpanel/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TOdayBill extends StatelessWidget {
  TOdayBill({super.key});
  var w;
  var h;
  var todaybillcont = Get.put(TOdayBillController());
  @override
  Widget build(BuildContext context) {
     w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return  FutureBuilder(
        future: todaybillcont.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
          return 
          Scaffold(appBar: AppBar(
            title: Text("check"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: ()async{
                   Rx initdate = DateTime.now().obs;
                   var firstdate = DateTime(2000, 02, 02);
  var lastdate = DateTime(2100, 02, 02);

                   DateTime? newdate = await showDatePicker(
        context: context,
        initialDate: initdate.value,
        firstDate: firstdate,
        lastDate: lastdate);
                  // todaybillcont.getData();
                }, child: Text("Refresh")),
                Text("Pending"),
                penlist(),
          Text("Orders"),
              list(),
              SizedBox(height: 50,)],
            ),),
          ),);

          
        },
      )
    ;
  }

  penlist() =>
    Obx(() { 
      if(todaybillcont.penlistlen.value == 0 )return Center(child: Text("No data"),);
      
      return ListView.builder( physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,itemCount: todaybillcont.penlistlen.value,
    itemBuilder: (context, index) => InkWell(
      onTap: () {
        todaybillcont.gotoOrderView( todaybillcont.penuidlist, index); 
      },
      child: Container(
        
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),  margin: EdgeInsets.symmetric(vertical: 10),
      
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


        Text("Ph No : ${todaybillcont.pennumberList.elementAt(index)}"),
        Text("Time : ${todaybillcont.pentimelist.elementAt(index)}"),
        Text("Total price : ${todaybillcont.penpricetotalList.elementAt(index)}"),
        Text("Items : "),
        SizedBox(height: 5,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Item name") ,Text("Category  ") ,Text("   Qnt   ") ],
          ),
        ),
       
        Divider(thickness: 2,),
        Container( child:penitmlist(index) ,padding: EdgeInsets.symmetric(horizontal: 10),), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ElevatedButton( onPressed: (){
            // todaybillcont.chageascomp(index);
            todaybillcont.changecustref(index);
            // todaybillcont.setComplete();
          }, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
         children: [Icon(Icons.check), SizedBox(width: 10,), Text("Completed")],)),

         ElevatedButton( onPressed: (){todaybillcont.orderCancel(index);}, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
         children: [Icon(Icons.check), SizedBox(width: 10,), Text("Delete")],))],)
      ],),
      ),
    ),);});

  list() =>
    Obx(() { 
      if(todaybillcont.listlen == 0 )return Text('Loading');
      return ListView.builder( physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
    shrinkWrap: true,itemCount: todaybillcont.listlen.value,
    itemBuilder: (context, index) => InkWell(
      onTap: () {
        todaybillcont.gotoOrderView( todaybillcont.uidlist,index); 
      },
      child: Container(
        
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),  margin: EdgeInsets.symmetric(vertical: 10),
      
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


        Text("Ph No : ${todaybillcont. numberList.elementAt(index)}"),
        Text("Time : ${todaybillcont.timelist.elementAt(index)}"),
        Text("Total price : ${todaybillcont.pricetotalList.elementAt(index)}"),
        Text("Items : "),
        SizedBox(height: 5,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(" Item name") ,Text("Category  ") ,Text("   Qnt   ") ],
          ),
        ),
       
        Divider(thickness: 2,),
        Container( child:itmlist(index) ,padding: EdgeInsets.symmetric(horizontal: 0),), 
        
      ],),
      ),
    ),);});

    penitmlist(idx)=>
  ListView.builder( shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
  itemCount: todaybillcont.penitemList.elementAt(idx).length,
  itemBuilder: (context, index) => Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(padding: EdgeInsets.symmetric(vertical: 3), width: w/3  -20, child: Text("${todaybillcont.penitemList.elementAt(idx).keys.elementAt(index)}",)) 
    ,Container (width: w/3 -20, child: Text("${todaybillcont.penitemList.elementAt(idx).values.elementAt(index)['Category']}")),
    Container(width: 40, child: Text("${todaybillcont.penitemList.elementAt(idx).values.elementAt(index)['Quantity']}", textAlign: TextAlign.center))],
  ),);
    
  itmlist(idx)=>
  ListView.builder( shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
  itemCount: todaybillcont.itemList.elementAt(idx).length,
  
  itemBuilder: (context, index) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,

    children: [
      Container(padding: EdgeInsets.symmetric(vertical: 3),  width: w/3 -20,child: Text("${todaybillcont.itemList.elementAt(idx).keys.elementAt(index)}",)) 
    ,Container (width: w/3     -20, child: Text("${todaybillcont.itemList.elementAt(idx).values.elementAt(index)['Category']}")),
    Container( width: 40,child: Text("${todaybillcont.itemList.elementAt(idx).values.elementAt(index)['Quantity']}", textAlign: TextAlign.center))
    ],
  ),);
}