import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

class DailySpecialLoad extends StatelessWidget {
  const DailySpecialLoad({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 45 , left: 25 , right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showshimmer( h * 0.07 ,w * 0.7,10),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showshimmer( h * 0.04 ,w * 0.35,10),
              showshimmer( h * 0.04 ,w * 0.2,10),
            ],
          ),
                    SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showshimmer( h * 0.25 ,w * 0.6,20),
              showshimmer( h * 0.2,w * 0.2,10),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showshimmer( h * 0.04 ,w * 0.35,10),
              showshimmer( h * 0.04 ,w * 0.2,10),
            ],
          ),
                    SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showshimmer( h * 0.25 ,w * 0.6,20),
              showshimmer( h * 0.2,w * 0.2,10),
            ],
          ),
                    SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showshimmer( h * 0.04 ,w * 0.35,10),
              showshimmer( h * 0.04 ,w * 0.2,10),
            ],
          ),
                    SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showshimmer( h * 0.25 ,w * 0.6,20),
              showshimmer( h * 0.2,w * 0.2,10),
            ],
          )

          ],
        ),
      ),
    ),);
  }
    showshimmer(height , width , double brad)=>Shimmer.fromColors(
              child: Container(width: width,height: height,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(brad)
               ,color: Colors.white),), 
               baseColor: Colors.grey[300]!, highlightColor: Colors.grey[100]!);
}