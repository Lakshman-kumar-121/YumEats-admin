import 'package:adminpanel/User/Alluser/Alluser.dart';
import 'package:adminpanel/Categoryselect/categoryselect.dart';
import 'package:adminpanel/Categoryselect/categoryselectload.dart';
import 'package:adminpanel/Mainscreen/Dailyspecial/DailySpeical.dart';
import 'package:adminpanel/Mainscreen/Dailyspecial/dailyspecialload.dart';
import 'package:adminpanel/Daywise/daywise.dart';
import 'package:adminpanel/Todaysbill/todaybill.dart';
import 'package:adminpanel/changeadditem/changeadditem.dart';
import 'package:adminpanel/check.dart';
import 'package:adminpanel/editcate/editcategory.dart';
import 'package:adminpanel/itemedit/itemedit.dart';
import 'package:adminpanel/pf/profilecreen.dart';
import 'package:adminpanel/subscreen/ownerdetails/Ownerdetails.dart';
import 'package:adminpanel/subscreen/feedback/fdback.dart';


import 'package:adminpanel/today.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Navigationbar extends StatelessWidget {
  Navigationbar({super.key});
  var screen = [
    // EditCategory(categoryname: "mew cate")
    // ChangeAddItem(itemname: "" ,category: "")
    // EditItem()
    // AllUser()
// Pastdata(),
TOdayBill(),
DailySpecial()  
// ,Daywise(),
,CategorySelect(),
Profile(),
  ];
  var nabar = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.category_outlined, size: 35),
      inactiveIcon: Icon(Icons.category_outlined, size: 28),
      activeColorPrimary: Color.fromARGB(255, 238, 238, 238),
      inactiveColorPrimary: Color.fromARGB(255, 153, 153, 153),
    ),
    
    PersistentBottomNavBarItem(
      inactiveIcon: Icon(Icons.home_outlined, size: 28),
      icon: Icon(Icons.home_outlined, size: 35),
      activeColorPrimary: Color.fromARGB(255, 238, 238, 238),
      inactiveColorPrimary: Color.fromARGB(255, 153, 153, 153),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: Icon(Icons.add_business_outlined, size: 28),
      icon: Icon(Icons.add_business_outlined, size: 35),
      activeColorPrimary: Color.fromARGB(255, 238, 238, 238),
      inactiveColorPrimary: Color.fromARGB(255, 153, 153, 153),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: Icon(Icons.person_outline, size: 28),
      icon: Icon(Icons.person_outline, size: 35),
      activeColorPrimary: Color.fromARGB(255, 238, 238, 238),
      inactiveColorPrimary: Color.fromARGB(255, 153, 153, 153),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PersistentTabView(
      margin: EdgeInsets.symmetric(horizontal: 05, vertical: 08),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      screens: screen,
      navBarStyle: NavBarStyle.style12,
      context,
      bottomScreenMargin: 0,
      backgroundColor: Color.fromARGB(255, 41, 41, 41),
      items: nabar,
    )
    );

  }
}