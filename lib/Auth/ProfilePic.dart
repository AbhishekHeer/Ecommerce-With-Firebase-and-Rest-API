import 'dart:io';

import 'package:ecommerce/Auth/AuthMethod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicPicker extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController comfirm;
  const ProfilePicPicker(
      {super.key,
      required this.email,
      required this.password,
      required this.comfirm});

  @override
  State<ProfilePicPicker> createState() => _ProfilePicPickerState();
}

final _name = TextEditingController();

bool colorchange = false;

final Storage = FirebaseStorage.instance;

final _db = FirebaseDatabase.instance.ref('users');

File? imagepath;

class _ProfilePicPickerState extends State<ProfilePicPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(Get.height * 0.04),
                child: Center(
                  child: InkWell(
                      onTap: () async {
                        await gallery();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: Get.width * 0.2,
                        child: CircleAvatar(
                          radius: Get.width * 0.196,
                          backgroundColor: Colors.white,
                          child: ClipPath(
                              clipper: WavyCircleClipper(1000),
                              child: Image(
                                image: _gallery?.absolute != null
                                    ? FileImage(_gallery!.absolute)
                                    : const AssetImage(
                                            'Assets/Images/shop-logo.jpg')
                                        as ImageProvider,
                                fit: BoxFit.cover,
                                height: Get.height,
                                width: Get.width,
                              )),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.1, horizontal: Get.width * 0.07),
                child: SearchBar(
                  controller: _name,
                  side: MaterialStatePropertyAll(
                      BorderSide(width: Get.width * 0.002)),
                  leading: IconButton(
                      onPressed: () {}, icon: const Icon(FontAwesomeIcons.pen)),
                  hintText: 'Choose User Name',
                ),
              ),
              GestureDetector(
                onTap: () async {
                  uploadImage(_gallery).then((value) async {
                    Navigator.pushReplacementNamed(context, '.home');
                    await Auth.signInWithPhoneNumber(widget.email,
                        widget.password, widget.comfirm, _name, value);
                  }).onError((error, stackTrace) {
                    print(error);
                  });
                },
                child: Container(
                  child: const Center(
                    child: Text('text'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  File? _gallery;
  Future<void> gallery() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final opencam = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    setState(() {
      if (opencam != null) {
        _gallery = File(opencam.path);
      }
    });
  }

  Future<String> uploadImage(var imageFile) async {
    final id = FirebaseAuth.instance.currentUser!.uid;
    final Storage = FirebaseStorage.instance;
    var path = Storage.ref().child('/Product-Images/$id').putFile(imageFile);
    var download = await path.snapshot.ref.getDownloadURL();
    final url = download.toString();

    return url;
  }
}
