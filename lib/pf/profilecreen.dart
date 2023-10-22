
import 'package:adminpanel/pf/profilescreencont.dart';
import 'package:adminpanel/subscreen/Ordercancel/ordercancel.dart';
import 'package:adminpanel/subscreen/feedback/fdback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';


import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);
   
  

  var profilecont = Get.put(ProfileScreenController());
  // var _profileCont = Get.put(profileController());
  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      // future: _profileCont.getName(),
      builder: (context, snapshot)  {
        if(snapshot.connectionState  == ConnectionState.waiting){
          // return ProfileLoading();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Your Account",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CustomPaint(
                    painter: RPSCustomPainter(),
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 15, right: 15, bottom: 50, top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              "Hello, Admin\n",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        height: 30,
                        color: Colors.black54,
                      ),
                      Text(
                        "Basic",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.03),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        child: Column(
                          children: [

                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 186, 212, 206),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width / .2,
                                    60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () => profilecont.gotoownerinfo(context),
                              label: Text(
                                "Edit Information",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 15,),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width / 0.2,
                                    60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () async {
                                profilecont.gotofeedback(context);
                              },
                              label: Text(
                                "All Feedback       ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              icon: Icon(
                                Icons.support_agent_rounded,
                                color: Colors.black54,
                              ),
                            ),
SizedBox(height: 15,),

                             OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 186, 212, 206),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width / .2,
                                    60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () {
                                 profilecont.gotoOrdercancel(context);
                              },
                              label: Text(
                                "Cancel Orders     ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              icon: Icon(
                                Icons.cancel_rounded,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 15,),
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width / 0.2,
                                    60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () async {
                                profilecont.gotohistory(context);
                              },
                              label: Text(
                                "Business history",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              icon: Icon(
                                Icons.history,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 40),
                      Text(
                        "Users",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04),
                            borderRadius: BorderRadius.all(Radius.circular(20))), padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                            child:  OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 186, 212, 206),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width / .2,
                                    60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () {
                                 profilecont.gotolistuser(context);
                              },
                              label: Text(
                                "List Users           ", 
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              icon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),),
                      Divider(height: 40),
                      Text(
                        "Authentication",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        child: Column(
                          children: [
                            
                         
                            OutlinedButton.icon(
                                onPressed: () {
                                  // _profileCont.logout();
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width / .5, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                                icon: Icon(
                                  Icons.logout,
                                  color: Color.fromARGB(255, 88, 88, 88),
                                ),
                                label: Text(
                                  "Logout      ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w300),
                                )),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  feedback(context) {
    return showDialog(
        context: context,
        builder: (index) => AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 20),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              content: TextField(
//                controller: pc.feedbackmessage,
                style: TextStyle(fontSize: 20),
                maxLines: 5,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "Feedback here", border: OutlineInputBorder()),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width / 3, 40)),
                        onPressed: () => {
                              Navigator.of(context).pop(),

                              // pc.feedbackmessage.clear()
                            },
                        child: Text("cancel")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width / 3, 40)),
                        onPressed: () {
                          // pc.feedback();
                          Navigator.of(context).pop();
                          if (true) //pc.feedbackmessage.text.isNotEmpty)
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Thankyou for your feedback")));
                          else
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please enter feedback"),
                            ));
                        },
                        child: Text("send"))
                  ],
                )
              ],
            ));
  }

  void feedbackDialog() => Get.defaultDialog(
    contentPadding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
        title: "Feedback",
        titlePadding: EdgeInsets.symmetric(vertical: 10),
        content: TextField(
          maxLines: 4,
          style: TextStyle(fontSize: 20, color: Colors.black54 ),
          decoration: InputDecoration(
            
              hintText: "Nice app",
              focusedBorder: OutlineInputBorder(
                
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              hintStyle: TextStyle(color: Colors.black45, fontSize: 20 ,height: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        onCancel: () {},
        cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 186, 212, 206), width: 1),
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 30)),
            onPressed: () {Get.back(closeOverlays: true);},
            child: Text("Cancel",
                style: TextStyle(fontSize: 17, color: Colors.black))),
        confirm: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Send",
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: Color.fromARGB(255, 186, 212, 206),
              padding: EdgeInsets.symmetric(horizontal: 40)),
        ),
      );
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 186, 212, 206)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.9413333, 0);
    path0.quadraticBezierTo(size.width * 0.9998133, size.height * -0.0047739,
        size.width, size.height * 0.0753769);
    path0.quadraticBezierTo(size.width, size.height * 0.2361307, size.width,
        size.height * 0.7183920);
    path0.quadraticBezierTo(size.width * 1.0026133, size.height * 0.8741206,
        size.width * 0.9048000, size.height * 0.8849749);
    path0.cubicTo(
        size.width * 0.3574400,
        size.height * 0.9683920,
        size.width * 0.3560267,
        size.height * 0.9718593,
        size.width * 0.1046667,
        size.height * 0.9949749);
    path0.quadraticBezierTo(size.width * 0.0251733, size.height * 1.0062312, 0,
        size.height * 0.8992965);
    path0.quadraticBezierTo(
        0, size.height * 0.2734422, 0, size.height * 0.0648241);
    path0.quadraticBezierTo(size.width * -0.0003467, size.height * -0.0192462,
        size.width * 0.0706667, 0);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
