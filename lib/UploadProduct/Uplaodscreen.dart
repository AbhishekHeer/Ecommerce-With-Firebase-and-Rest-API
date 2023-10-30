import 'dart:io';

import 'package:ecommerce/Getx/stepcont.dart';
import 'package:ecommerce/Messeges/Messege.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => UploadScreenState();
}

File? first;
File? secc;
File? third;
File? fourth;
File? thumbnail;

final productname = TextEditingController();
final price = TextEditingController();
final description = TextEditingController();
StepperController step = Get.put(StepperController());

class UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Upload Product'),
        ),
        body: Obx(() => Stepper(
                connectorColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 208, 51, 51)),
                onStepContinue: () {
                  step.nextstep(
                    context,
                    productname,
                    description,
                    price,
                    thumbnail?.absolute,
                  );
                },
                onStepCancel: () {
                  step.back();
                },
                currentStep: step.index.value,
                steps: [
                  Step(
                      isActive: true,
                      state: step.index <= 0
                          ? StepState.indexed
                          : StepState.complete,
                      title: const Text('Note'),
                      content: Column(
                        children: <Widget>[
                          const Text(
                              '1.) Minimum 4 Picture Of Product Is Requried '),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          const Text(
                              '2.) People see Your Product If They Are Intersted Than You Messege'),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          const Text(
                              '2.) People see Your Product If They Are Intersted Than You Messege'),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          const Text(
                              '2.) People see Your Product If They Are Intersted Than You Messege'),
                        ],
                      )),
                  Step(
                    isActive: step.index >= 1,
                    state: step.index <= 1
                        ? StepState.indexed
                        : StepState.complete,
                    title: const Text('Details'),
                    content: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        TextField(
                          controller: productname,
                          decoration: InputDecoration(
                              label: const Text('Product Name'),
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Get.height * 0.02))),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        TextField(
                          controller: description,
                          decoration: InputDecoration(
                              label: const Text('Product Discription'),
                              hintText: 'Discription',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Get.height * 0.02))),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        TextField(
                          controller: price,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              label: const Text('Product Price'),
                              hintText: 'Price in \$',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Get.height * 0.02))),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                  Step(
                    isActive: step.index >= 2,
                    state: step.index <= 2
                        ? StepState.indexed
                        : StepState.complete,
                    title: const Text('Images'),
                    content: Column(
                      children: [
                        //first image

                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Get.height * .02),
                          child: Center(
                            child: Text('Thumbnail Of Your Product',
                                style: GoogleFonts.castoro(
                                    fontSize: Get.width * .04)),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await thumbimage();
                          },
                          child: Container(
                            height: Get.height * 0.16,
                            width: Get.width * 0.7,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: Get.width * 0.002,
                                    color: Colors.white)),
                            child: Center(
                                child: thumbnail?.absolute != null
                                    ? Image(
                                        image: FileImage(thumbnail!.absolute),
                                        fit: BoxFit.cover,
                                        width: Get.width,
                                      )
                                    : Icon(
                                        CupertinoIcons.photo,
                                        size: Get.width * 0.06,
                                      )),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                ])));
  }

  //thumbnail
  Future<void> thumbimage() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final gallery = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    setState(() {
      if (gallery != null) {
        thumbnail = File(gallery.path);
      } else {
        Messege.ToastMessage('No Pic Slected');
      }
    });
  }
}
