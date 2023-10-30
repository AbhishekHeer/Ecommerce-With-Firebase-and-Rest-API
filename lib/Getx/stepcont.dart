import 'dart:io';

import 'package:ecommerce/Getx/Post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class StepperController extends GetxController {
  RxInt index = 0.obs;

  nextstep(
    BuildContext context,
    TextEditingController title,
    TextEditingController disc,
    TextEditingController price,
    File? thumb,
  ) async {
    index++;
    if (index >= 3) {
      index.value -= 1;

      await Future.delayed(const Duration(seconds: 5), () {
        showDialog(
            context: context,
            builder: ((context) {
              return Center(
                child: SizedBox(
                  height: Get.height * 0.07,
                  width: Get.width * 0.07,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }));
      });
      PostApiController(title, disc, price, thumb!);
      index.value == 0;
    }
  }

  back() {
    --index;
    if (index <= 0) {
      Get.toNamed('/home');
      index = 0.obs;
    }
  }

  //image Picker
  File? Ggallery;
  Future<void> gallery() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final opencam = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);

    if (opencam != null) {
      cropImage(opencam.path);
    } else {
      Get.snackbar('!!!', 'No Picture Selected By User');
    }
  }

  Future cropImage(String image) async {
    CroppedFile? cropped =
        await ImageCropper().cropImage(sourcePath: image, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Crop',
          cropGridColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(title: 'Crop')
    ]);

    if (cropped != null) {
      Ggallery = File(cropped.path);
    }
  }

  void clearImage() {
    Ggallery = null;
  }

  Future<void> imageCropper() async {
    XFile? images = await ImagePicker().pickImage(source: ImageSource.gallery);
    var cropper = (await ImageCropper()
        .cropImage(sourcePath: images!.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
      CropAspectRatioPreset.ratio7x5
    ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          // toolbarColor: Theme.of(context).colorScheme.primary,
          // toolbarWidgetColor: Theme.of(context).colorScheme.onPrimary,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          // cropFrameColor: Theme.of(context).colorScheme.primary,
          cropGridColor: Colors.red,
          showCropGrid: false),
    ]));

    if (cropper != null) {
      Ggallery = File(cropper.path);
    }
  }
}
