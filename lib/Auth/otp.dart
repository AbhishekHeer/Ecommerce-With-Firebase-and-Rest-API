// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  String VerificationId;
  OTPScreen({
    Key? key,
    required this.VerificationId,
  }) : super(key: key);
  final OTP = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: Get.height * .17,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Get.width * .03))),
              controller: OTP,
            ),
          ),
          SizedBox(
            height: Get.height * .06,
          ),
          InkWell(
            onTap: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: VerificationId, smsCode: OTP.text);
              await FirebaseAuth.instance
                  .signInWithCredential(credential)
                  .then((value) {
                Get.to('/home');
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(Get.width * .02)),
              height: Get.height * .06,
              width: Get.width * .8,
              child: const Center(
                child: Text('Next'),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
