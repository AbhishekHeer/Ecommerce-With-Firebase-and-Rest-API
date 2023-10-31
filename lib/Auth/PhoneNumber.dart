import 'dart:io';

import 'package:ecommerce/Auth/AuthMethod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final email = TextEditingController();
final password = TextEditingController();
final comfirmpassword = TextEditingController();

final _db = FirebaseAuth.instance;

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: Get.height * .1,
                child: const Center(
                  child: Text('Sign Up With Phone Number'),
                )),
            SizedBox(
              height: Get.height * .04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.06,
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(h * 0.02))),
              ),
            ),
            SizedBox(
              height: Get.height * .04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.06,
              ),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: password,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(h * 0.02))),
              ),
            ),
            SizedBox(
              height: Get.height * .04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.06,
              ),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: comfirmpassword,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(h * 0.02))),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            InkWell(
              onTap: () {
                Auth.signInWithPhoneNumber(email, password, comfirmpassword);
              },
              child: Container(
                width: Get.width * .8,
                height: Get.height * .06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.width * .03),
                    color: Colors.redAccent),
                child: const Center(
                  child: Text('Next'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
