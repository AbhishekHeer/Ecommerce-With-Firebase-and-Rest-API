// ignore: file_names

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce/Getx/get.dart';
import 'package:ecommerce/UploadProduct/Uplaodscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final Myontroller = Get.put(MyController());
final bottom = Get.put(BottomnaviController());

final iconList = <IconData>[
  CupertinoIcons.home,
  CupertinoIcons.settings_solid,
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          return bottom.screen.elementAt(bottom.index.value);
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const UploadScreen());
          },
          shape: const CircleBorder(eccentricity: 0.8),
          child: const Icon(CupertinoIcons.cloud_upload),
          //params
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
              notchMargin: Get.width * 0.02,
              height: Get.height * 0.09,
              backgroundColor: Colors.blueAccent,
              icons: iconList,
              gapWidth: Get.width * 0.2,
              activeIndex: bottom.index.value,
              gapLocation: GapLocation.center,
              leftCornerRadius: Get.width * 0.05,
              rightCornerRadius: Get.width * 0.05,
              onTap: (index) {
                bottom.index.value = index;
              },
            )));
  }
}
