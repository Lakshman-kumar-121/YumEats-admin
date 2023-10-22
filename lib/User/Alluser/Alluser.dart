import 'package:adminpanel/User/Alluser/allusercont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class AllUser extends StatelessWidget {
   AllUser({super.key});
   var allusercont = Get.put(AllUserController());
   var w;
   var h;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: allusercont.getData(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting)return CircularProgressIndicator();
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.only(bottom: 80),
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true, 
              itemCount: allusercont.datalen,physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) => useritm(index),),
          ),
        ),
      );
    },);
  }
  useritm(index)=> InkWell(
    onTap: () {
      allusercont.gotoSingleUser(allusercont.uId.elementAt(index), allusercont.data.elementAt(index));
    },
    child: Container(
  decoration: BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(15)
  ),
      margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
      width: 100 , height: 112,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network("${ allusercont.data.elementAt(index)["Personaldata"]["Photo"]}" ,  width: 80, fit: BoxFit.cover,)),
              Positioned(
                bottom: 0,
                right: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white
                  ),
                  margin: EdgeInsets.symmetric( vertical: 2),
                  padding: EdgeInsets.symmetric(horizontal: 2 ,vertical: 0),
                  child: Row(
                    children: [
                      Text(allusercont.streak.elementAt(index).toString()),
                      Icon(Icons.local_fire_department , color: Colors.amberAccent,),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: w* 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${ allusercont.data.elementAt(index)["Personaldata"]["Name"]}" , style: TextStyle(
                  fontSize: 20 , fontWeight: FontWeight.w500 ,overflow: TextOverflow.ellipsis
                ),),

                Text("Nos: ${ allusercont.data.elementAt(index)["Personaldata"]["Number"]}" , style: TextStyle(
                  fontSize: 20 , fontWeight: FontWeight.w500
                )),
                                Text("Uid: ${ allusercont.data.elementAt(index)["Personaldata"]["UID"]}" , style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500
                )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}