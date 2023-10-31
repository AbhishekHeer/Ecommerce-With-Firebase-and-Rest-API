import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Messege {
  static ToastMessage(String messege) {
    Fluttertoast.showToast(
        msg: messege, timeInSecForIosWeb: 2, gravity: ToastGravity.CENTER);
  }

  static buttom(String text) {
    final cont = Container(
      height: Get.height * .06,
      width: Get.width * .8,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(Get.width * .04),
      ),
      child: Center(
        child: Text(text),
      ),
    );
    return cont;
  }
}
