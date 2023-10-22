import 'package:adminpanel/Orderview/Orderviewcont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Orderview extends StatelessWidget {
  Orderview({super.key ,required this.cusId , required this.itemlist ,required this.totalprice});
  var cusId;
  var itemlist;
  var totalprice;
  var orderviewcont = Get.put(OrderViewController());
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    
    return FutureBuilder(
      future: orderviewcont.getdata(cusId),
      builder: (context, snapshot) {
        
        if(snapshot.connectionState == ConnectionState.waiting)return CircularProgressIndicator();
        return Scaffold(appBar: AppBar(),
        
         body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
         
            Center(
              child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network('${orderviewcont.ImageUrl}' 
              ,width:w * 0.4 , height: h * 0.18, fit: BoxFit.cover,),
              ),
            ),
                Center(child: Text("Profile")),
         
            Text("Name : ${orderviewcont.Name}"),
            Text("Email : ${orderviewcont.Email}"),
            Text("Number : ${orderviewcont.Number}"),
            Text("Address : ${orderviewcont.Address}"),
            Text("Order time : "),
            Text("Total price : ${totalprice}"),
            Divider(thickness: 1.5,),
            Text("Items : "),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: itemlist.length,
              itemBuilder: (context, index) => item(context , index) ,)
             ],),),
         ),);
      }
    );
  }
  item(context , index)=> Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('${itemlist.keys.elementAt(index)}') ,Text('${itemlist.values.elementAt(index)['Quantity']}') ,],
    ),
  );
}