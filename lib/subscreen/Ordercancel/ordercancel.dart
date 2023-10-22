import 'package:adminpanel/subscreen/Ordercancel/ordercancelcont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class OrderCancel extends StatelessWidget {
   OrderCancel({super.key});
   var Ordercancelcont = Get.put(OrderCancelController());
  var w;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width/2.8;
    print("go");
    return Scaffold(appBar: AppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
            child: Column(children: [
              
                  Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 242, 195) ,borderRadius: BorderRadius.circular(20)),
      
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Obx(() => Text("Date : ${Ordercancelcont.initdate.value.day} - ${Ordercancelcont.initdate.value.month} - ${Ordercancelcont.initdate.value.year}" 
        , style:TextStyle(fontSize: 20 , fontWeight: FontWeight.w600) ,),)
        ,
      IconButton(
        onPressed: (){
        Ordercancelcont.pickdate(context);
      }, icon: Icon(Icons.edit_calendar_outlined ,size: 30,),padding: EdgeInsets.zero,),
      
       IconButton(onPressed: (){
        Ordercancelcont.getData();
       }, icon: Icon(Icons.search ,size: 30,),padding: EdgeInsets.zero,)]),
    ),

    FutureBuilder(builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting)return CircularProgressIndicator();
      return list();
    },
    future: Ordercancelcont.getData(), )
              
            ],),
          ),
        ),);
      
    
  }

   list() =>
    Obx(() { 
      if(Ordercancelcont.listlen == 0 )return Text('No data');
      return ListView.builder( physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,itemCount: Ordercancelcont.listlen.value,
    itemBuilder: (context, index) => InkWell(
      onTap: () {
        Ordercancelcont.gotoOrderView(index); 
      },
      child: Container(
        
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),  margin: EdgeInsets.symmetric(vertical: 10),
      
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


        Text("Ph No : ${Ordercancelcont. numberList.elementAt(index)}"),
        Text("Time : ${Ordercancelcont.timelist.elementAt(index)}"),
        Text("Total price : ${Ordercancelcont.pricetotalList.elementAt(index)}"),
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
        Container( child:itmlist(index) ,padding: EdgeInsets.symmetric(horizontal: 10),), 
  
      ],),
      ),
    ),);});


  itmlist(idx)=>
  ListView.builder( shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
  itemCount: Ordercancelcont.itemList.elementAt(idx).length,
  itemBuilder: (context, index) => Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(padding: EdgeInsets.symmetric(vertical: 3), width: w  -20, child: Text("${Ordercancelcont.itemList.elementAt(idx).keys.elementAt(index)}",)) 
    ,Container (width: w -20, child: Text("${Ordercancelcont.itemList.elementAt(idx).values.elementAt(index)['Category']}")),
    Container(width: w/2 -20, child: Text("${Ordercancelcont.itemList.elementAt(idx).values.elementAt(index)['Quantity']}", textAlign: TextAlign.center))],
  ),);
}