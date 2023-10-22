import 'package:adminpanel/Categoryselect/categoryselectcont.dart';
import 'package:adminpanel/Categoryselect/categoryselectload.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CategorySelect extends StatelessWidget {
  var w;
  var h;
  CategorySelect({super.key});
  var _categoryselect = Get.put(CategorySelectController());
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: _categoryselect.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CategorySelectLoad();
          return Scaffold(
            appBar: AppBar(title: Text("Categories"),),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => _categoryselect.gotoadditem(),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 178, 178, 178)),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white60,
                                    border: Border.all(
                                        width: 2, color: Colors.black87)),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Icon(
                                  Icons.add,
                                  size: 100,
                                )),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 1,
                              height: 100,
                              color: Colors.white70,
                            ),
                            Text(
                              "Add \nNew Item",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 80),
                        child: ListView.builder(
                          
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _categoryselect.itemlen,
                          itemBuilder: (context, index) => Column(children: [items(index) , Divider(thickness: 1,)]),
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }

  items(index) => InkWell(
        onTap: () {
          _categoryselect
              .gotocateview("${_categoryselect.category.elementAt(index)}");
        },
        child: Container(
          
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  index % 2 == 0
                      ? Color.fromARGB(255, 91, 76, 151)
                      : Color.fromARGB(255, 0, 175, 185),
                  index % 2 == 0
                      ? Color.fromARGB(255, 28, 60, 161)
                      : Color.fromARGB(255, 254, 217, 183),
                ],
              ),
            ),
            child: index % 2 == 0 ? lefright(index) : rightleft(index)),
      );
  lefright(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              _categoryselect.categoryUrl.elementAt(index),
              width: w * 0.4,
              height: h * 0.18,
              fit: BoxFit.fill,
            )),
        Container(
          color: Colors.white70,
          width: 1,
          height: 100,
          margin: EdgeInsets.only(left: 10),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _categoryselect.category.elementAt(index),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              overflow: TextOverflow.fade,
            ),
            Text("Items : 5",
            style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              overflow: TextOverflow.fade,),
            ElevatedButton(
               style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white60,
                                    shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
                                  ),
              onPressed: (){
              _categoryselect.gotoeditcate(_categoryselect.category.elementAt(index));
            }, child: Row(
              children: [Icon(Icons.edit , color: Colors.black,),
              Text(" Change" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.w700),)],
            ))
          ],
        )
      ],
    );
  }

  rightleft(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _categoryselect.category.elementAt(index),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              overflow: TextOverflow.fade,
            ),
            Text(
              "Items : 5",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              overflow: TextOverflow.fade,
            ),
          ],
        ),
        Container(
          color: Colors.white70,
          width: 1,
          height: 100,
          margin: EdgeInsets.only(left: 10),
        ),
        SizedBox(width: 5),
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              _categoryselect.categoryUrl.elementAt(index),
              width: w * 0.4,
              height: h * 0.18,
              fit: BoxFit.fill,
            )),
      ],
    );
  }
}
