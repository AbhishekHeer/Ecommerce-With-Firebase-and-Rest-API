import 'dart:io';

import 'package:ecommerce/Auth/AuthMethod.dart';
import 'package:ecommerce/Auth/ForgetPass.dart';
import 'package:ecommerce/Messeges/Messege.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//controller
final _email = TextEditingController();
final _password = TextEditingController();

//focus node

FocusNode _emailnode = FocusNode();
FocusNode _passwordnode = FocusNode();

//firebase auth
final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 191, 188, 188),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Image(
              image: const AssetImage(
                'Assets/Images/shop-logo.jpg',
              ),
              fit: BoxFit.cover,
              height: h * 0.3,
              width: w,
            )),
            SizedBox(
              height: Get.height * .01,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //google
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: InkWell(
                    onTap: () {
                      try {
                        Auth.signInWithGoogle().then((value) {
                          Navigator.pushNamed(context, '/pic');
                          Messege.ToastMessage('Choose Your Profile Pic');
                        }).onError((error, stackTrace) {
                          Messege.ToastMessage(error.toString());
                        });
                      } on FirebaseAuthException {
                        Get.snackbar('error', 'Firebase Error');
                      } on SocketException {
                        Get.snackbar('Internet', 'No Network');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: w * 0.003),
                          borderRadius: BorderRadius.circular(w * 0.1)),
                      child: Center(
                          child: Lottie.asset(
                        'Assets/Animation/google.json',
                        repeat: true,
                        reverse: true,
                        height: h * 0.05,
                      )),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: InkWell(
                    onTap: () {
                      try {
                        Auth.signInWithFacebook().then((value) {
                          Navigator.pushNamed(context, '/pic');
                          Messege.ToastMessage('Choose Your Profile Pic');
                        }).onError((error, stackTrace) {
                          Messege.ToastMessage(error.toString());
                        });
                      } on FirebaseAuthException {
                        Get.snackbar('error', 'Firebase Error');
                      } on SocketException {
                        Get.snackbar('Internet', 'No Network');
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        try {
                          Auth.signInWithFacebook().then((value) {
                            Navigator.pushNamed(context, '/pic');
                            Messege.ToastMessage('Choose Your Profile Pic');
                          }).onError((error, stackTrace) {
                            Messege.ToastMessage(error.toString());
                          });
                        } on FirebaseAuthException {
                          Get.snackbar('error', 'Firebase Error');
                        } on SocketException {
                          Get.snackbar('Internet', 'No Network');
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: w * 0.003),
                            borderRadius: BorderRadius.circular(w * 0.1)),
                        child: Center(
                            child: InkWell(
                          onTap: () {
                            try {
                              Auth.signInWithFacebook().then((value) {
                                Navigator.pushNamed(context, '/pic');
                                Messege.ToastMessage('Choose Your Profile Pic');
                              }).onError((error, stackTrace) {
                                Messege.ToastMessage(error.toString());
                              });
                            } on FirebaseAuthException {
                              Get.snackbar('error', 'Firebase Error');
                            } on SocketException {
                              Get.snackbar('Internet', 'No Network');
                            }
                          },
                          child: Lottie.asset(
                            'Assets/Animation/facebook.json',
                            repeat: true,
                            reverse: true,
                            height: h * 0.05,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            )),

            SizedBox(
              height: Get.height * .01,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.05, vertical: w * 0.03),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                focusNode: _emailnode,
                decoration: InputDecoration(
                  hintText: 'Email',
                  label: const Text('Email'),
                  suffix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.at,
                      size: w * 0.04,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(h * 0.02)),
                ),
                onSubmitted: (value) {
                  _emailnode.unfocus();
                  FocusScope.of(context).requestFocus(_passwordnode);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.06, vertical: w * 0.03),
              child: TextField(
                  obscureText: true,
                  controller: _password,
                  focusNode: _passwordnode,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      label: const Text('Password'),
                      suffix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.lock,
                          size: w * 0.05,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(h * 0.02)))),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.1,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Get.to(ForgetPassword());
                  },
                  child: Text(
                    'Forget Password',
                    style: TextStyle(fontSize: w * 0.03),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            //button
            GestureDetector(
              onTap: () {
                _auth
                    .signInWithEmailAndPassword(
                        email: _email.text.toString(),
                        password: _password.text.toString())
                    .then((value) {
                  Navigator.pushNamed(context, '/home');
                  Messege.ToastMessage('Login Successfully');
                  _email.clear();
                  _password.clear();
                }).onError((error, stackTrace) {
                  Messege.ToastMessage(error.toString());
                });
              },
              child: Container(
                  height: h * 0.06,
                  width: w * 0.3,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: w * 0.005, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(w / 2)),
                  child: const Center(
                    child: Text('Login'),
                  )),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dont Have An Account ?',
                  style: TextStyle(fontSize: w * 0.04),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    "Sign-Up",
                    style:
                        TextStyle(color: Colors.blueAccent, fontSize: w * 0.04),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
