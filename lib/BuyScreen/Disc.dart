// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/Getx/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ShowDisc extends StatelessWidget {
  String disc;
  ShowDisc({
    Key? key,
    required this.disc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.15),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Center(
              child: Text(
            'About Product',
            selectionColor: Colors.amber,
            softWrap: true,
            style: GoogleFonts.abhayaLibre(
                fontStyle: FontStyle.normal,
                fontSize: Get.width * 0.06,
                fontWeight: FontWeight.w500),
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: Divider(
              color: Colors.black,
              thickness: Get.width * 0.003,
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          SafeArea(
            child: Center(
                child: Text(
              disc.toString(),
              softWrap: true,
              style: GoogleFonts.abhayaLibre(
                  fontSize: Get.width * 0.06, fontWeight: FontWeight.w500),
            )),
          ),
        ],
      ),
    );
  }
}

BottomnaviController navi = Get.put(BottomnaviController());
