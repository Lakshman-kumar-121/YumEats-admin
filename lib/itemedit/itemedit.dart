import 'package:adminpanel/itemedit/itemeditcont.dart';
import 'package:adminpanel/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class EditItem extends StatelessWidget {
   EditItem({super.key , required this.category , required this.itemname});
   var category;
   var itemname;
   var edititemcont = Get.put(ItemEditContrlller());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: edititemcont.getData(category,itemname),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        return Scaffold(
          appBar: AppBar(title: Text("e"),),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "${edititemcont.imageurl}",
                          width: 250,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Text("Basic"),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.2)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Text("Name : ${edititemcont.itemname}"),
                        Text("Discrption : ${edititemcont.discription}"),
                        Text("Price : ${edititemcont.price}"),
                        Text("Status")
                      ],
                    ),
                  ),
                  Divider(),
                  Text("Star & Review"),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.2)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: edititemcont.lenlis,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => star( edititemcont.starlist.elementAt(index) , index),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  star(value, index) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("UID : ${edititemcont.uidlist.elementAt(index)}"),
            Text("Name : ${edititemcont.namelist.elementAt(index)}"),
            Row(
              children: [
                Text("Star : ${edititemcont.starlist.elementAt(index)}"),
                genstar(value, 1),
                genstar(value, 2),
                genstar(value, 3),
                genstar(value, 4),
                genstar(value, 5),
              ],
            ),
            Text("Review:"),
            Divider(),
            Text("${edititemcont.reviewlist.elementAt(index)}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.edit), Text("${edititemcont.datelist.elementAt(index)}")],
            )
          ],
        ),
      );
  genstar(index, point) {
    if (index > point && index < point + 1) {
      return Icon(
        Icons.star_half,
        color: Colors.amberAccent,
      );
    } else if (index >= point) {
      return Icon(Icons.star, color: Colors.amberAccent);
    } else {
      return Icon(Icons.star_border, color: Colors.amberAccent);
    }
  }
}
