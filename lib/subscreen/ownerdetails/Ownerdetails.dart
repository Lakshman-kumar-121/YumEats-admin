import 'package:adminpanel/subscreen/ownerdetails/Ownerdetailscont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class OwnerDetails extends StatelessWidget {
   OwnerDetails({super.key});
   var _Ownerdetailcont= Get.put(OwnerDetailsController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder (
      future: _Ownerdetailcont.getData(),
      builder: (context, snapshot) {
        
      
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 10 , bottom: 50),
              child: Column(
                
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,),
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5) ,borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 15 ,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("WhatsaApp Number",style: TextStyle(fontSize: 17 ,fontWeight: FontWeight.w600)),
                      SizedBox(height: 15,),
                       Obx(() => IntlPhoneField(
                        
                        enabled: _Ownerdetailcont.numSelect.value,
                            style: TextStyle(fontSize: 17),
                            controller: _Ownerdetailcont.numberController,
                            initialCountryCode: "2",
                            
                            
                            initialValue: _Ownerdetailcont.numberController.text,
                            dropdownTextStyle: TextStyle(fontSize: 17),
                            flagsButtonPadding: EdgeInsets.only(left: 15, bottom: 2),
                            showDropdownIcon: false,
                            onCountryChanged: ((country) {
                              
                              // _SignupContoller.countrycode = country.dialCode;
                              
                              
                            }),
                            showCountryFlag: false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: "Number",
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),) ,
                          Row(mainAxisAlignment: MainAxisAlignment.end
                          , children: [ TextButton(onPressed: (){
                            if(_Ownerdetailcont.numSelect.isTrue){
                              _Ownerdetailcont.numSelect.value = false;
                            }
                            else{
                              _Ownerdetailcont.ChangeDialog(1);
                            }
                          }, child: Text("Change" ,style: TextStyle(color: Colors.red 
                          ,fontSize: 16 ,fontWeight: FontWeight.w600),))],)
                    ],
                  ),),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6),borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Map",style: TextStyle(fontSize: 17 ,fontWeight: FontWeight.w600)),
                      SizedBox(height: 20,),
                      Obx(() =>  TextField(
                        controller: _Ownerdetailcont.maplatController,
                        
                        enabled: _Ownerdetailcont.mapSelect.value,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: "Latitude",
                                labelStyle: TextStyle(color: Colors.black),
                                suffixIcon:  Icon(
                                      Icons.location_on_outlined,
                                      size: 30,
                                    )),
                          ),),
                          SizedBox(height: 20,),
                      Obx(() =>  TextField(
                        controller: _Ownerdetailcont.maplongController,
                        enabled: _Ownerdetailcont.mapSelect.value,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: "Longitude",
                                labelStyle: TextStyle(color: Colors.black),
                                suffixIcon:
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 30,
                                    )),
                          )),
                          Row(mainAxisAlignment: MainAxisAlignment.end
                          , children: [ TextButton(onPressed: (){
                             if(_Ownerdetailcont.mapSelect.isTrue){
                              _Ownerdetailcont.mapSelect.value = false;
                            }
                            else{
                              _Ownerdetailcont.ChangeDialog(2);
                            }
                          }, child: Text("Change" ,style: TextStyle(color: Colors.red 
                          ,fontSize: 16 ,fontWeight: FontWeight.w600),))],)
          
                    ],
                  ),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6),borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Token") ,SizedBox(height: 10,), 
                      Obx(() => TextField(
                        controller: _Ownerdetailcont.tokenController,
                        enabled: _Ownerdetailcont.tokenSelect.value,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: "Private key",
                                labelStyle: TextStyle(color: Colors.black),
                                suffixIcon:
                                    Icon(
                                      Icons.key,
                                      size: 30,
                                    )),
                          )),
                      
         Row(mainAxisAlignment: MainAxisAlignment.end
                          , children: [ TextButton(onPressed: (){
                            
                             if(_Ownerdetailcont.tokenSelect.isTrue){
                              _Ownerdetailcont.tokenSelect.value = false;
                            }
                            else{
                              _Ownerdetailcont.ChangeDialog(3);
                            }
                          }, child: Text("Change" ,style: TextStyle(color: Colors.red 
                          ,fontSize: 16 ,fontWeight: FontWeight.w600),))],) ],),),
                          SizedBox(height: 21,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(MediaQuery.of(context).size.width * 0.85,50 ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                            ),
                            onPressed: (){
                            _Ownerdetailcont.saveChanges();
                          }, child: Text("Save changes" ,style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)),
                          SizedBox(height: 21,),
          
                  ],
              ),
            ),
          ),
        );
      }
    );  
  }
}