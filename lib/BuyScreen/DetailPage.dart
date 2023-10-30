// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:action_slider/action_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ecommerce/BuyScreen/Disc.dart';
import 'package:ecommerce/BuyScreen/Photos.dart';
import 'package:ecommerce/Getx/get.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String image0;
  String image1;
  String image2;
  String image3;
  String title;
  String price;
  int rating;
  String dicc;
  String thumb;
  DetailPage({
    Key? key,
    required this.image0,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.title,
    required this.price,
    required this.rating,
    required this.dicc,
    required this.thumb,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

MyController items = Get.put(MyController());
BottomnaviController navi = Get.put(BottomnaviController());

int index = 0;

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    List widd = [
      ShowDisc(
        disc: widget.dicc,
      ),
      ShowPhotosOfProduct(
        image0: widget.image0,
        image1: widget.image1,
        image2: widget.image2,
        image3: widget.image3,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: [
                  Hero(
                    tag: 'pic',
                    child: GestureDetector(
                        onTap: () {
                          context.pushTransparentRoute(SecondPage(
                            image: widget.thumb,
                          ));
                        },
                        child: Image(image: NetworkImage(widget.thumb))),
                  ),
                  GestureDetector(
                      onTap: () {
                        context.pushTransparentRoute(SecondPage(
                          image: widget.image0,
                        ));
                      },
                      child: Image(image: NetworkImage(widget.image0))),
                  GestureDetector(
                      onTap: () {
                        context.pushTransparentRoute(SecondPage(
                          image: widget.image1,
                        ));
                      },
                      child: Image(image: NetworkImage(widget.image1))),
                  GestureDetector(
                      onTap: () {
                        context.pushTransparentRoute(SecondPage(
                          image: widget.image2,
                        ));
                      },
                      child: Image(image: NetworkImage(widget.image2))),
                  GestureDetector(
                      onTap: () {
                        context.pushTransparentRoute(SecondPage(
                          image: widget.image3,
                        ));
                      },
                      child: Image(image: NetworkImage(widget.image3))),
                ],
                options: CarouselOptions(
                  height: Get.height * 0.4,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
              child: Center(
                child: Hero(
                  tag: 'title',
                  child: Text(
                    widget.title,
                    style: GoogleFonts.notoMusic(
                      fontSize: Get.width * .06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: Get.height * 0.06,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.height * 0.04),
                      border: Border.all(
                        width: Get.width * 0.002,
                      )),
                  child: Center(
                    child: Hero(
                      tag: 'rating',
                      child: Text(
                        widget.rating.toString(),
                        style: GoogleFonts.museoModerno(
                            fontSize: Get.width * 0.07),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: ((context) {
                          return AlertDialog.adaptive(
                            content: Text(
                                'Thanks For Buy ${widget.title}. But This Is An Dummy Items ... Click Ok To Go Back HomePage'),
                            title: const Center(
                              child: Row(
                                children: [
                                  Text('Thanks For Love'),
                                  Icon(CupertinoIcons.heart_fill)
                                ],
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    child: const Icon(Icons.clear),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Get.toNamed('/home');
                                    },
                                  ),
                                ],
                              )
                            ],
                          );
                        }));
                  },
                  child: Container(
                    height: Get.height * 0.06,
                    width: Get.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Get.height * 0.04),
                        border: Border.all(
                          width: Get.width * 0.002,
                        )),
                    child: Center(
                      child: Text(
                        "\$${widget.price.toString()}",
                        style: GoogleFonts.museoModerno(
                            fontSize: Get.width * 0.07),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: Get.width * 0.0004, color: Colors.black),
                ),
                child: DefaultTabController(
                    initialIndex: 0,
                    length: 2,
                    child: TabBar(
                        onTap: (value) {
                          setState(() {
                            index = value;
                          });
                        },
                        indicatorWeight: Get.height * 0.004,
                        indicatorSize: TabBarIndicatorSize.tab,
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.03,
                        ),
                        tabs: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.02),
                            child: const Icon(
                              FontAwesomeIcons.solidNoteSticky,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.02),
                            child: const Icon(
                              CupertinoIcons.photo,
                            ),
                          ),
                        ])),
              ),
            ),
            widd.elementAt(index)
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.1, vertical: Get.height * 0.02),
        child: ActionSlider.standard(
          backgroundColor: Colors.transparent,
          sliderBehavior: SliderBehavior.move,
          borderWidth: Get.width * 0.02,
          child: Text(
            'Slide to confirm',
            style: GoogleFonts.rajdhani(
                fontWeight: FontWeight.w700, fontSize: Get.width * 0.04),
          ),
          action: (controller) async {
            controller.loading(); //starts loading animation
            await Future.delayed(const Duration(seconds: 3));
            controller.success();

            Get.snackbar(widget.title, 'Your Order Have Been placed');
          },
          //many more parameters
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  String image;

  SecondPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () {
        Navigator.of(context).pop();
      },
      direction: DismissiblePageDismissDirection.multi,
      isFullScreen: false,
      child: Hero(
        tag: 'Unique tag',
        child: Image.network(
          image,
          filterQuality: FilterQuality.medium,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
