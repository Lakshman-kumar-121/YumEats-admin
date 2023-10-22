import 'package:adminpanel/Orderview/datepick/datepickcont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Datepicker extends StatelessWidget {
  Datepicker({super.key});
  var _datepickcont = Get.put(DatepickController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    );
  }

}