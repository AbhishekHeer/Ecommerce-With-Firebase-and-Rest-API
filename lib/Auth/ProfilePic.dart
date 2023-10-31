import 'dart:io';

import 'package:ecommerce/Getx/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicPicker extends StatefulWidget {
  const ProfilePicPicker({super.key});

  @override
  State<ProfilePicPicker> createState() => _ProfilePicPickerState();
}

final _name = TextEditingController();

bool colorchange = false;

final Storage = FirebaseStorage.instance;
ImagePicController imagepic = Get.put(ImagePicController());

final _db = FirebaseDatabase.instance.ref('Image');

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
                  onChanged: (value) {},
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        colorchange ? Colors.red : Colors.white)),
                child: const Text('Enter'),
                onPressed: () {
                  imagepic.uploadfile(_gallery!, _name.text.toString());
                },
              )
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
}
