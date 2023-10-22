import 'package:adminpanel/Mainscreen/AddCate/Addcate.dart';
import 'package:adminpanel/categoryview/categoryview.dart';
import 'package:adminpanel/editcate/editcategory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategorySelectController extends GetxController{
  var category;
  var categoryUrl;
  var itemlen = 0;
  var totalitemlist ;
  var firebaseFirestore = FirebaseFirestore.instance;
  getData()async{
    var d = await firebaseFirestore.collection('Food').doc('Category').get();
    if(d.exists){
      itemlen = d.data()!.length;
      category = d.data()?.keys;
      categoryUrl = d.data()?.values;

    }

  }
  gotocateview(cat)=> Get.to(()=> CategoryView(category: cat));
  gotoadditem()=>  Get.to(()=> AddCategory());
  gotoeditcate(name)=> Get.to(EditCategory(categoryname: name));
}