// ignore: file_names
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  // final db = FirebaseDatabase.instance.ref();

//google sign in

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final image = FirebaseAuth.instance.currentUser?.photoURL;
      final nme = FirebaseAuth.instance.currentUser?.displayName;
      final email = FirebaseAuth.instance.currentUser?.email;
      final id = FirebaseAuth.instance.currentUser?.uid.toString();

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      FirebaseAuth.instance.signInWithCredential(credential).printInfo();

      if (FirebaseAuth.instance.currentUser!.uid == email) {
        FirebaseDatabase.instance.ref("users").child(id!).get();
      }

      var re = await FirebaseDatabase.instance
          .ref('users')
          .child(id!)
          .set({'id': id, 'image': image, 'email': email, "name": nme}).then(
              (value) {
        navigator!.pushReplacementNamed('/home');
      });
      return re;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //phone number

  static signInWithPhoneNumber(
      TextEditingController email0,
      TextEditingController password,
      TextEditingController comfirmpassword,
      nme,
      String image0) async {
    try {
      final id = FirebaseAuth.instance.currentUser?.uid;

      if (FirebaseAuth.instance.currentUser?.uid == email0.text) {
        FirebaseDatabase.instance.ref("users").child(id!).get();
      }

      if (email0.text.isEmpty ||
          password.text.isEmpty ||
          password.text.isEmpty) {
        Get.snackbar('Opps', 'Something Is Missing');
      } else if (password.text != comfirmpassword.text) {
        Get.snackbar('Password', "Password Is Not Matched !!");
      } else {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email0.text.toString(),
                password: comfirmpassword.text.toString())
            .then((value) async {
          await FirebaseDatabase.instance.ref('users').child(id!).set({
            'id': id,
            'image': image0,
            'email': email0.text,
            "name": nme
          }).then((value) {
            navigator!.pushReplacementNamed('/home');
          });

          email0.clear();
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
