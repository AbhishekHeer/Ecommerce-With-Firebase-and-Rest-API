// ignore: file_names

import 'package:ecommerce/Getx/get.dart';
import 'package:ecommerce/Getx/payment.dart';
import 'package:ecommerce/Getx/radio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class Shopitems extends StatefulWidget {
  const Shopitems({
    super.key,
  });

  @override
  State<Shopitems> createState() => _ShopitemsState();
}

Likeproduct like = Get.put(Likeproduct());
RadioController radio = Get.put(RadioController());
BuyitemController buy = Get.put(BuyitemController());

class _ShopitemsState extends State<Shopitems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        centerTitle: true,
      ),
      body: Obx(() {
        return buy.items.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset('Assets/Animation/cart.json',
                        fit: BoxFit.contain,
                        repeat: true,
                        reverse: true,
                        width: Get.width / 2),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Text(
                    'Nothing Is Here',
                    style: GoogleFonts.niramit(fontSize: Get.width * .05),
                  ),
                ],
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: Get.height * .25),
                itemCount: buy.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * .008,
                          horizontal: Get.width * 0.02),
                      child: InkWell(
                        onLongPress: () {
                          showAdaptiveDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: const Center(
                                    child: Text('remove ?'),
                                  ),
                                  content: SizedBox(
                                    height: Get.height * .1,
                                    child: Center(
                                      child:
                                          Text('Remove ${buy.Title[index]} ?'),
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('cancel'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            buy.reomvie(
                                                buy.items[index],
                                                buy.Title[index],
                                                buy.Dis[index],
                                                buy.Price[index],
                                                buy.Thumb[index]);
                                            Get.back();
                                          },
                                          child: const Text('Remove'),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.circular(Get.width * 0.02)),
                          width: Get.width * 0.0002,
                          child: GridTile(
                              child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: Get.height * .01),
                                child: Image(
                                  image:
                                      NetworkImage(buy.Thumb[index].toString()),
                                  fit: BoxFit.contain,
                                  height: Get.height * .1,
                                  width: Get.width,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  buy.Title[index].toString(),
                                  style: GoogleFonts.niramit(
                                      fontSize: Get.width * .03),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '\$ ${buy.Price[index].toString()}',
                                    style: GoogleFonts.niramit(
                                        fontSize: Get.width * .05),
                                  ),
                                ],
                              ),
                            ],
                          )),
                        ),
                      ));
                },
              );
      }),
      bottomSheet: InkWell(
        onTap: () {
          if (buy.items.isEmpty) {
            Get.snackbar('Empty', 'Please Add Items Before Buy');
          } else {
            PaymentController().bottomsheet(
                context, buy.Title.toString(), buy.Price.toString());
          }
        },
        child: Container(
            height: Get.height * .07,
            width: Get.width,
            decoration: const BoxDecoration(color: Colors.redAccent),
            child: const Center(child: Text('Tap To Buy'))),
      ),
    );
  }
}
