import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final db = FirebaseDatabase.instance.ref('Product').child(id);
String id = DateTime.now().microsecondsSinceEpoch.toString();
PostApiController(TextEditingController title, TextEditingController disc,
    TextEditingController price, File thumb) async {
  final url = await uploadImage(thumb);

  await db.set({
    'title': title.text.toString(),
    'disc': disc.text.toString(),
    'price': price.text.toString(),
    'thumb': url,
  }).then((value) {
    Get.toNamed('/home');
    Get.snackbar('Successfully',
        'Product Detail Has Been Uploaded For See Your Product Go To Setting>Your Product');
    title.clear();
    price.clear();
    disc.clear();
    thumb.delete();
  }).onError((error, stackTrace) {
    Get.snackbar('Error', error.toString());
  });
}

Future<String> uploadImage(var imageFile) async {
  final Storage = FirebaseStorage.instance;
  var path = Storage.ref().child('/Product-Images/$id').putFile(imageFile);
  var download = await path.snapshot.ref.getDownloadURL();
  final url = download.toString();

  return url;
}
