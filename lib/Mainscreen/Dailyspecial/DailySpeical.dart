import 'package:adminpanel/Mainscreen/Dailyspecial/dailyspecialload.dart';
import 'package:adminpanel/Mainscreen/Dailyspecial/dailyspecialont.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DailySpecial extends StatelessWidget {
  DailySpecial({super.key});
  var w;
  var h;
  var _dailySpecialCont = Get.put(DailySpecialController());
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: _dailySpecialCont.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return DailySpecialLoad();
          return Scaffold(
            appBar: AppBar( title: Text("Daily Special"),),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 500,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255,91, 76, 151),
                Color.fromARGB(255, 28, 60, 161),
                
              ],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "    Sunday",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white60,
                                    shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
                                  ),
                                    onPressed: () {
                                      _dailySpecialCont.gotoChangespecial(
                                          _dailySpecialCont.sunday, "Sunday");
                                    },
                                    child: Text("Change" ,style: TextStyle(color: Colors.black87 , fontSize: 16 , fontWeight: FontWeight.bold),)))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) =>
                              corbuild(index, _dailySpecialCont.sunday),
                          options: CarouselOptions(
                            
                            autoPlay: true,
                              height: h * 0.28,
                              enlargeCenterPage: true,
                              padEnds: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                        )
                      ],
                    ),
                  )),


                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 500,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255,128, 2, 0),
                Color.fromARGB(255, 227, 100, 20),
                
              ],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "    Monday",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.w600)
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white60,
                                    shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
                                  ),
                                    onPressed: () {
                                      _dailySpecialCont.gotoChangespecial(
                                          _dailySpecialCont.monday, "Monday");
                                    },
                                    child: Text("Change" ,style: TextStyle(color: Colors.black87 , fontSize: 16 , fontWeight: FontWeight.bold),)))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) =>
                              corbuild(index, _dailySpecialCont.monday),
                          options: CarouselOptions(
                            autoPlay: true,
                              height: h * 0.28,
                              enlargeCenterPage: true,
                              padEnds: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                        )
                      ],
                    ),
                  )),




                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 500,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255,0, 175, 185),
                Color.fromARGB(255, 254, 217, 183),
                
              ],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "    Tuesday",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.w600)
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white60,
                                    shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
                                  ),
                                    onPressed: () {
                                      _dailySpecialCont.gotoChangespecial(
                                          _dailySpecialCont.tueday, "Tuesday");
                                    },
                                    child: Text("Change" ,style: TextStyle(color: Colors.black87 , fontSize: 16 , fontWeight: FontWeight.bold),)))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) =>
                              corbuild(index, _dailySpecialCont.tueday),
                          options: CarouselOptions(
                            autoPlay: true,
                              height: h * 0.28,
                              enlargeCenterPage: true,
                              padEnds: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                        )
                      ],
                    ),
                  )),





                  Container(
                    
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 500,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255,91, 76, 151),
                Color.fromARGB(255, 28, 60, 161),
                
              ],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "    Wednesday",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.w600)
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white60,
                                    shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
                                  ),
                                    onPressed: () {
                                      _dailySpecialCont.gotoChangespecial(
                                          _dailySpecialCont.wedday, "Wednesday");
                                    },
                                    child: Text("Change" ,style: TextStyle(color: Colors.black87 , fontSize: 16 , fontWeight: FontWeight.bold),)))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) =>
                              corbuild(index, _dailySpecialCont.wedday),
                          options: CarouselOptions(
                            autoPlay: true,
                              height: h * 0.28,
                              enlargeCenterPage: true,
                              padEnds: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                        )
                      ],
                    ),
                  )),




                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 500,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                             Color.fromARGB(255,128, 2, 0),
                Color.fromARGB(255, 227, 100, 20),
                
              ],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "    Thursday",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.w600)
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white60,
                                    shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
                                  ),
                                    onPressed: () {
                                      _dailySpecialCont.gotoChangespecial(
                                          _dailySpecialCont.thurday, "Thursday");
                                    },
                                    child: Text("Change" ,style: TextStyle(color: Colors.black87 , fontSize: 16 , fontWeight: FontWeight.bold),)))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) =>
                              corbuild(index, _dailySpecialCont.thurday),
                          options: CarouselOptions(
                            autoPlay: true,
                              height: h * 0.28,
                              enlargeCenterPage: true,
                              padEnds: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                        )
                      ],
                    ),
                  )),

                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 500,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                             Color.fromARGB(255,0, 175, 185),
                Color.fromARGB(255, 254, 217, 183),
                
              ],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "    Friday",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.w600)
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white60,
                                    shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
                                  ),
                                    onPressed: () {
                                      _dailySpecialCont.gotoChangespecial(
                                          _dailySpecialCont.friday, "Friday");
                                    },
                                    child: Text("Change" ,style: TextStyle(color: Colors.black87 , fontSize: 16 , fontWeight: FontWeight.bold),)))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) =>
                              corbuild(index, _dailySpecialCont.friday),
                          options: CarouselOptions(
                            autoPlay: true,
                              height: h * 0.28,
                              enlargeCenterPage: true,
                              padEnds: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                        )
                      ],
                    ),
                  )),
                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 500,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255,91, 76, 151),
                Color.fromARGB(255, 28, 60, 161),
                
              ],
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "    Saturday",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.w600)
                            ),
                            Container(
                                padding: EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white60,
                                    shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
                                  ),
                                    onPressed: () {
                                      _dailySpecialCont.gotoChangespecial(
                                          _dailySpecialCont.satday, "Saturday");
                                    },
                                    child: Text("Change" ,style: TextStyle(color: Colors.black87 , fontSize: 16 , fontWeight: FontWeight.bold),)))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider.builder(
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) =>
                              corbuild(index, _dailySpecialCont.satday),
                          options: CarouselOptions(
                            autoPlay: true,
                              height: h * 0.28,
                              enlargeCenterPage: true,
                              padEnds: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                        ),
                        
                      ],
                    ),
                  )),
                  SizedBox(height: 80,)
                ],
              )
            ),
          );
        });
  }

  corbuild(index, day) => Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: h * 0.22,
            width: 1500,
            decoration: BoxDecoration(
              border: Border.all(width: 2 ,color: Colors.white),
              borderRadius: BorderRadius.circular(15)
            ),
            child: ClipRRect(
              
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  
                  day.values.elementAt(index),
                  
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${day.keys.elementAt(index)}",
            style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
          )
        ],
      );

  dailyspecial() => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 300,
        height: 150,
        color: Colors.green,
        child: Row(
          children: [
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png",
              width: 150,
            )
          ],
        ),
      );
}
