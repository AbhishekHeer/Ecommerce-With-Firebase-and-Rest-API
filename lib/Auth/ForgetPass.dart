import 'package:ecommerce/Auth/AuthMethod.dart';
import 'package:ecommerce/Messeges/Messege.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final _db = FirebaseAuth.instance;
  final ForgetEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * .1),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .04),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: ForgetEmail,
                  decoration: InputDecoration(
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Get.width * .03))),
                )),
            SizedBox(
              height: Get.height * .05,
            ),
            InkWell(
              onTap: () {
                forget(ForgetEmail);
              },
              child: Messege.buttom('Forget'),
            )
          ],
        ),
      ),
    );
  }
}
