import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion/motion.dart';

// ignore: must_be_immutable
class HeadDrawer extends StatelessWidget {
  HeadDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseDatabase.instance.ref('detail').onValue,
        builder: ((context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final name = snapshot.data!.snapshot.child('name').value.toString();
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Get.width * .04),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: Get.width * 0.13,
                          child: ClipOval(
                            child: Motion(
                              child: Image(
                                image: NetworkImage(snapshot.data!.snapshot
                                    .child('image')
                                    .value
                                    .toString()),
                                fit: BoxFit.cover,
                                height: Get.height,
                                width: Get.width / 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: Get.width * 0.16, bottom: Get.height * 0.01),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: IconButton(
                              onPressed: () async {
                                await gallery();
                                await updateimage(_gallery!);
                              },
                              icon: Icon(
                                FontAwesomeIcons.pencil,
                                size: Get.width * .05,
                              ),
                            )))
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.niramit(fontSize: Get.width * 0.04),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }));
  }

  File? _gallery;
  Future<void> gallery() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final opencam = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (opencam != null) {
      _gallery = File(opencam.path);
    }
  }

  final _db = FirebaseDatabase.instance;

  Future<void> updateimage(File galleryPhoto) async {
    var path = 'update';
    final file = File(galleryPhoto.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask task = ref.putFile(file);

    final snapshot = await task.whenComplete(() {});
    final download = await snapshot.ref.getDownloadURL();

    if (galleryPhoto.path.isEmpty) {
      Get.snackbar('!!!', ' No Pic Selected By user');
    } else {
      await _db.ref().child('detail').update({
        'image': download,
      }).then((value) {
        Get.snackbar("Update Photo ", 'It Will Take Some Time !!');
      }).onError((error, stackTrace) {
        Get.snackbar('Error', error.toString());
      });
    }
  }
}
