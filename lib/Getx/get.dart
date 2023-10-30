import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/Model/ProductModel.dart';
import 'package:ecommerce/Pages/HomeBody.dart';
import 'package:ecommerce/Setting/Setting.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyController extends GetxController {
  RxList<dynamic> item = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  var isLoading = false.obs;
  ProductModel? model;

  fetchData() async {
    try {
      isLoading(true);
      http.Response response =
          await http.get(Uri.tryParse('https://dummyjson.com/products')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        model = ProductModel.fromJson(result);
      } else {
        Get.snackbar("Error", "There Is An Error While Data Loading",
            dismissDirection: DismissDirection.horizontal);
      }
    } on SocketException {
      Get.snackbar('Network Error', 'Make Sure Your Internet Is Connected !!');
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          dismissDirection: DismissDirection.horizontal);
    } finally {
      isLoading(false);
    }
  }
}

class Likeproduct extends GetxController {
  RxList like = [].obs;
  RxList Title = [].obs;
  RxList Dis = [].obs;
  RxList Price = [].obs;
  RxList Thumb = [].obs;
  addproduct(int index, String title, dics, int price, String thumbnail) {
    like.add(index);
    Title.add(title);
    Dis.add(dics);
    Price.add(price);
    Thumb.add(thumbnail);
  }

  removeproduct(int index, String title, dics, int price, String thumbnail) {
    like.remove(index).obs;
    Title.remove(title).obs;
    Dis.remove(dics).obs;
    Price.remove(price).obs;
    Thumb.remove(thumbnail).obs;
  }
}

class BottomnaviController extends GetxController {
  RxInt index = 0.obs;
  RxList screen = [const HomeBody(), const Setting()].obs;

  movenext(value) {
    index = value.obs;
    screen.elementAt(index.value);
  }
}

class ImagePicController extends GetxController {
  final _db = FirebaseDatabase.instance;

  Future<void> uploadfile(File galleryPhoto, String naam) async {
    var path = 'files';
    final file = File(galleryPhoto.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask task = ref.putFile(file);

    final snapshot = await task.whenComplete(() {});
    final download = await snapshot.ref.getDownloadURL();

    if (galleryPhoto.path.isEmpty) {
      Get.snackbar('Error', 'Please Select Profile Pic',
          dismissDirection: DismissDirection.horizontal);
    } else if (naam.isEmpty) {
      Get.snackbar('Error', 'Please Choose Name',
          dismissDirection: DismissDirection.horizontal);
    } else {
      await _db
          .ref()
          .child('detail')
          .set({'image': download, 'name': naam}).then((value) {
        Get.toNamed('/home');
        Get.snackbar("Login Successful", 'Happy Shopping : )',
            dismissDirection: DismissDirection.horizontal);
      }).onError((error, stackTrace) {
        Get.snackbar('Error', error.toString(),
            dismissDirection: DismissDirection.horizontal);
      });
    }
  }
}

class ThumbController extends GetxController {
  RxList like = [].obs;

  up(int index) {
    like.add(index.obs);
  }

  down(int index) {
    like.remove(index).obs;
  }
}

class ThemeController extends GetxController {
  var change = true.obs;

  modechange(value) async {
    change = value.obs;
    if (change == false.obs) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }
  }
}

class BuyitemController extends GetxController {
  RxList items = [].obs;
  RxList Title = [].obs;
  RxList Dis = [].obs;
  RxList Price = [].obs;
  RxList Thumb = [].obs;
//additems
  additems(int index, String title, dics, int price, String thumbnail) {
    items.add(index);
    Title.add(title);
    Dis.add(dics);
    Price.add(price);
    Thumb.add(thumbnail);
  }

//remove items
  reomvie(
    int index,
    String title,
    dics,
    int price,
    String thumbnail,
  ) {
    items.remove(index);
    Title.remove(title);
    Dis.remove(dics);
    Price.remove(price);
    Thumb.remove(thumbnail);
  }

  addandRemove(int index, title, dics, int price, String thumbnail) {
    if (items.contains(index)) {
      reomvie(index, title, dics, price, thumbnail);
    } else {
      additems(index, title, dics, price, thumbnail);
    }
  }
}





// class PriceCountController extends GetxController {
// Rxint
// }