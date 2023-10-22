import 'package:adminpanel/User/Singleuser/singleusercont.dart';
import 'package:adminpanel/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SingleUser extends StatelessWidget {
  SingleUser({ required this.Uid , required this.data,super.key});
  var Uid;
  var data;
  var singleusercont = Get.put(SingleUserController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: singleusercont.getData(Uid, data),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 20 ,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3,color: Colors.black),
                          borderRadius: BorderRadius.circular(200)
                        ),
                        child: ClipRRect(                    
                          borderRadius: BorderRadius.circular(500),
                          child: Image.network('${singleusercont.photourl}' , width: 200, height: 200,  fit: BoxFit.cover,)),
                      ),
                      Text("${singleusercont.name}" , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 20),),
                      SizedBox(height: 10,)
                    ],
                  ),

                  
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5 ,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.5)
                  ),
                  child: Column(
                    children: [
                      Text('Basic'),
                      Text("Streak count: "),
                      
                    ],
                  ),
                ),
                SizedBox(height: 10,),
Text('  Basic'),
                Container(
                  width: double.infinity,      
                  padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text("Uid: ${singleusercont.uid}"),
                      Text("Name: ${singleusercont.name}"),
                      Text("Number: ${singleusercont.number}"),
                      Text("Email: ${singleusercont.email}"),
                      Text("Address: ${singleusercont.address}"),
                      Text("Stripe token: ${singleusercont.skey}"),
                      Text("Gender: ${singleusercont.gender}"),
                    ],
                  ),
                ),
Divider(color: Colors.black54),
Text('Fav'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.2)
                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: singleusercont.favlen,
                        itemBuilder: (context, index) {
                        
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("${singleusercont.favitem.elementAt(index)}"),
                            Text("${singleusercont.favcat.elementAt(index)}"),
                          ],);
                        }
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        );
      }
    );
  }
}