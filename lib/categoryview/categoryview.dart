import 'package:adminpanel/categoryview/categoryviewcont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
   CategoryView({super.key , required this.category});
   var category;
   var categoryviewcont = Get.put(CategoryViewController());
  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: categoryviewcont.getData(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
        return Scaffold(appBar: AppBar(),body: Container(
          
          child: Column(
            children: [
              InkWell(
                onTap: () => categoryviewcont.gotoadditem(category),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) ,color: Colors.grey),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) ,color: Colors.white60),
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Icon(Icons.add , size: 100,))
                      ,
                      Text("Add \nNew Item" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: categoryviewcont.listlen,
                itemBuilder: (context, index) => items(context , index),),
            ],
          ),
        ),);
      }
    );
  }
  items(context , index)=> InkWell(
    onTap: (){
      categoryviewcont.gotoviewitem(context, category, categoryviewcont.namelist.elementAt(index));
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      color: Colors.blueAccent.withOpacity(0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network('${categoryviewcont.imagelist.elementAt(index)}' ,height: 100,width: 100,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Name: ${categoryviewcont.namelist.elementAt(index)}"),
            Text("Price : ${categoryviewcont.pricelist.elementAt(index)}"),
            Row(children: [
              
              genstar(index, 1),
              genstar(index, 2),
              genstar(index,3),
              genstar(index,4),
              genstar(index,5),
              Text(' : ${categoryviewcont.rate.elementAt(index)}')
              ,
            ],),
            Row(children: [
                ElevatedButton(onPressed: (){
                  categoryviewcont.gotoedit(context, category,  categoryviewcont.namelist.elementAt(index));
                }, child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 5,),
                    Text("Edit")
                  ],
                ),
                ),
                ElevatedButton(onPressed: (){
                  categoryviewcont.remove(category ,index);
                }, child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5,),
                    Text("Remove")
                  ],
                ),
                
                )
              ],)
          ],)
        ],
      ),
    ),
  );
  genstar( index,point)
  {
    if (categoryviewcont.rate.elementAt(index) > point && categoryviewcont.rate.elementAt(index) < point + 1 ){
      return Icon(Icons.star_half ,color: Colors.amberAccent,);
    }
    else if (categoryviewcont.rate.elementAt(index) >= point){
      return Icon(Icons.star,color: Colors.amberAccent);
    }
    else{
      return Icon(Icons.star_border,color: Colors.amberAccent);
    }
  }
}