// ignore: file_names
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
//google sign in
  static Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //phone number

  static signInWithPhoneNumber(
      TextEditingController email,
      TextEditingController password,
      TextEditingController comfirmpassword) async {
    try {
      if (email.text.isEmpty ||
          password.text.isEmpty ||
          password.text.isEmpty) {
        Get.snackbar('Opps', 'Something Is Missing');
      } else if (password.text != comfirmpassword.text) {
        Get.snackbar('Password', "Password Is Not Matched !!");
      } else {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text.toString(),
                password: comfirmpassword.text.toString())
            .then((value) async {
          await Get.toNamed('/pic');
          Get.snackbar('Done', 'Login Successfully');
          email.clear();
          password.clear();
          comfirmpassword.clear();
        });
      }
    } on SocketException {
      Get.snackbar("Network Error", "Make Sure Your Intenet Is Connected !! ");
    } on FirebaseException {
      Get.snackbar('Error', "User Is Already Have An Account");
    }
  }

  static Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}

class forget {
  final _db = FirebaseAuth.instance;
  forget(TextEditingController ForgetEmail) {
    try {
      _db.sendPasswordResetEmail(email: ForgetEmail.text.toString());
    } on SocketException {
      Get.snackbar('Error', 'Network Error');
    } on FirebaseException {
      Get.snackbar("Error", "Enter Email Is Not valid");
    }
  }
}
