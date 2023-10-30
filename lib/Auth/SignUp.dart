import 'package:ecommerce/Auth/AuthMethod.dart';
import 'package:ecommerce/Messeges/Messege.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(
              'Assets/Animation/login.json',
              fit: BoxFit.contain,
              height: h * 0.3,
            ),
            Center(
              child: Text(
                'Sign-Up Method',
                style: GoogleFonts.alegreyaSansSc(fontSize: w * 0.06),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),

            //google
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.1),
              child: InkWell(
                onTap: () {
                  Auth.signInWithGoogle().then((value) {
                    Navigator.pushNamed(context, '/home');
                    Messege.ToastMessage('Thanks For SignUp');
                  }).onError((error, stackTrace) {
                    Messege.ToastMessage(error.toString());
                  });
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
            SizedBox(
              height: h * 0.04,
            ),

            //github
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.1),
              child: InkWell(
                onTap: () {
                  // Auth.signInWithFacebook().then((value) {
                  //   Navigator.pushNamed(context, routes.home);
                  //   Messege.ToastMessage('Thanks For SignUp');
                  // }).onError((error, stackTrace) {
                  //   Messege.ToastMessage(error.toString());
                  // });
                },
                child: InkWell(
                  onTap: () {
                    // Auth.signInWithFacebook().then((value) {
                    //   Navigator.pushNamed(context, routes.home);
                    //   Messege.ToastMessage('Thanks For SignUp');
                    // }).onError((error, stackTrace) {
                    //   Messege.ToastMessage(error.toString());
                    // });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: w * 0.003),
                        borderRadius: BorderRadius.circular(w * 0.1)),
                    child: Center(
                        child: InkWell(
                      onTap: () {
                        // Auth.signInWithFacebook().then((value) {
                        //   Navigator.pushNamed(context, routes.home);
                        //   Messege.ToastMessage('Thanks For SignUp');
                        // }).onError((error, stackTrace) {
                        //   Messege.ToastMessage(error.toString());
                        // });
                      },
                      child: Lottie.asset(
                        'Assets/Animation/github.json',
                        repeat: true,
                        reverse: true,
                        height: h * 0.05,
                      ),
                    )),
                  ),
                ),
              ),
            ),

            //phone number
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.04),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: w * 0.003),
                      borderRadius: BorderRadius.circular(w * 0.1)),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.github),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
