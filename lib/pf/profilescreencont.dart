import 'package:adminpanel/Daywise/daywise.dart';
import 'package:adminpanel/User/Alluser/Alluser.dart';
import 'package:adminpanel/check.dart';
import 'package:adminpanel/subscreen/Ordercancel/ordercancel.dart';
import 'package:adminpanel/subscreen/feedback/fdback.dart';
import 'package:adminpanel/subscreen/ownerdetails/Ownerdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController{

  gotoOrdercancel(context)=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderCancel(),));
  gotofeedback(context)=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => Fdback(),));
   gotoownerinfo(context)=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => OwnerDetails(),));

  gotolistuser(context)=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllUser(),));
  gotohistory(context)=>  
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pastdata(),));

}