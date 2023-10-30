// ignore: file_names
import 'package:ecommerce/Drawer/drawerbody.dart';
import 'package:ecommerce/LikedProduct.dart/LikedProductBody.dart';
import 'package:ecommerce/Pages/Productload.dart';
import 'package:ecommerce/Pages/ShoppingItemScreen.dart';
import 'package:ecommerce/Getx/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

MyController api = Get.put(MyController());
Likeproduct like = Get.put(Likeproduct());

final _search = TextEditingController();

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'E-Co',
            style: GoogleFonts.niramit(
              fontSize: h * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          actions: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LikeProductBody()));
                      },
                      icon: const Icon(CupertinoIcons.heart_fill)),
                ),
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * .06, bottom: Get.height * 0.025),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: like.like.isNotEmpty
                            ? Container(
                                width: Get.width * 0.04,
                                height: Get.height * 0.02,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Get.height * .5),
                                    color: Colors.red),
                                child: Center(
                                  child: Text(
                                    like.like.length.toString(),
                                    style: GoogleFonts.niramit(
                                      fontSize: Get.width * 0.03,
                                    ),
                                  ),
                                ),
                              )
                            : null),
                  );
                }),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Shopitems()));
                      },
                      icon: const Icon(CupertinoIcons.shopping_cart)),
                ),
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * .06, bottom: Get.height * 0.025),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: buyitem.items.isNotEmpty
                            ? Container(
                                width: Get.width * 0.04,
                                height: Get.height * 0.02,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Get.height * .5),
                                    color: Colors.red),
                                child: Center(
                                  child: Text(
                                    buyitem.items.length.toString(),
                                    style: GoogleFonts.niramit(
                                      fontSize: Get.width * 0.03,
                                    ),
                                  ),
                                ),
                              )
                            : null),
                  );
                }),
              ],
            ),
            SizedBox(
              width: w * 0.02,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Get.height * 0.03,
                          left: Get.height * 0.03,
                          bottom: Get.height * 0.03,
                          right: Get.height * 0.03),
                      child: TextField(
                        controller: _search,
                        decoration: InputDecoration(
                            hintText: 'Search',
                            label: const Text('Search Here'),
                            suffix: const Icon(CupertinoIcons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Get.height * 0.02))),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              ProductLoad(
                search: _search.text,
              )
            ],
          ),
        ),
        drawer: const BodyDrawer());
  }
}
