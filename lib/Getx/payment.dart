import 'package:ecommerce/Messeges/Messege.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentController {
  final num = TextEditingController();
  final date = TextEditingController();
  final cvv = TextEditingController();

  void bottomsheet(BuildContext context, String title, prize) {
    Get.bottomSheet(BottomSheet(
        dragHandleSize: Size(Get.width * .8, Get.height * .02),
        onClosing: () {
          Navigator.pop(context);
        },
        builder: ((context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: Get.height * .02,
                ),
                Center(
                  child: Text('You Slected An $title'),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Center(
                  child: Text(
                    "Price $prize",
                    style: GoogleFonts.notoSansMiao(fontSize: Get.width * .05),
                  ),
                ),
                SizedBox(
                  height: Get.height * .04,
                ),
                // ATM Number
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: TextField(
                      controller: num,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Get.width * .03)),
                        hintText: 'ATM Card Number',
                        suffix: Padding(
                          padding: EdgeInsets.only(right: Get.width * .03),
                          child: const Icon(FontAwesomeIcons.paypal),
                        ),
                      ),
                    )),
                SizedBox(
                  height: Get.height * .03,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),

//date
                          child: TextField(
                            controller: date,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(Get.width * .03)),
                              // fillColor:  MaterialStatePropertyAll(Colors.grey),
                              hintText: 'Date',
                              suffix: Padding(
                                padding:
                                    EdgeInsets.only(right: Get.width * .03),
                                child: const Icon(CupertinoIcons.time),
                              ),
                            ),
                          )),
                    ),

                    //cvv
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          child: TextField(
                            controller: cvv,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(Get.width * .03)),
                              // fillColor:  MaterialStatePropertyAll(Colors.grey),
                              hintText: 'CVV',
                              suffix: Padding(
                                padding:
                                    EdgeInsets.only(right: Get.width * .03),
                                child: const Icon(FontAwesomeIcons.ccVisa),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.0,
                ),
                Container(
                  height: Get.height * .07,
                  margin: EdgeInsets.symmetric(
                    vertical: Get.height * 0.04,
                    horizontal: Get.width * .07,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(Get.width * 0.03)),
                  child: InkWell(
                    onTap: () async {
                      if (num.text.isEmpty ||
                          date.text.isEmpty ||
                          cvv.text.isEmpty) {
                      } else if (num.text.length != 16) {
                        Messege.ToastMessage('ATM card Is Not Valid');
                      } else if (cvv.text.length != 3) {
                        Messege.ToastMessage('CVV Is Not Valid');
                      } else {
                        await Future.delayed(const Duration(seconds: 3), () {});
                        Get.snackbar(title, 'Your Order Have Been placed');
                        Navigator.pop(context);
                      }
                    },
                    child: Center(
                        child: Text(
                      'Place Order',
                      style: GoogleFonts.rajdhani(fontSize: Get.width * .05),
                    )),
                  ),
                )
                //   Padding(
                //     padding: EdgeInsets.symmetric(
                //         horizontal: Get.width * 0.1, vertical: Get.height * 0.02),
                //     child: ActionSlider.standard(
                //       backgroundColor: Colors.transparent,
                //       sliderBehavior: SliderBehavior.move,
                //       borderWidth: Get.width * 0.02,
                //       child: Text(
                //         'Slide to confirm',
                //         style: GoogleFonts.rajdhani(
                //             fontWeight: FontWeight.w700,
                //             fontSize: Get.width * 0.04),
                //       ),
                //       action: (controller) async {
                //         controller.loading(); //starts loading animation
                //         await Future.delayed(const Duration(seconds: 3));
                //
                //       },
                //       //many more parameters
                //     ),
                //   ),
              ],
            ),
          );
        })));
  }
}
