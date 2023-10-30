import 'package:ecommerce/Getx/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeProductBody extends StatefulWidget {
  const LikeProductBody({super.key});

  @override
  State<LikeProductBody> createState() => _LikeProductBodyState();
}

Likeproduct like = Get.put(Likeproduct());
BuyitemController buyitems = Get.put(BuyitemController());

class _LikeProductBodyState extends State<LikeProductBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Liked Product'),
        ),
        body: Obx(() {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1.2),
            itemCount: like.like.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: Get.width * .05,
                  ),
                  height: Get.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.height * 0.04),
                      border: Border.all(
                          width: Get.width * .002, color: Colors.white)),
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage(like.Thumb[index].toString()),
                        fit: BoxFit.contain,
                        height: Get.height * 0.1,
                        width: Get.width,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.09),
                                child: Text(
                                  like.Title[index].toString(),
                                  style: GoogleFonts.museoModerno(
                                      fontSize: Get.width * 0.05),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.07),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            CupertinoIcons.star_fill)),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      like.removeproduct(
                                        like.like[index],
                                        like.Title[index].toString(),
                                        like.Dis[index].toString(),
                                        like.Price[index],
                                        like.Thumb[index].toString(),
                                      );

                                      Get.snackbar('Remove',
                                          'Product Remove Successfully',
                                          isDismissible: true,
                                          backgroundGradient:
                                              const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                Colors.pink,
                                                Colors.blue
                                              ]));
                                    },
                                    icon: Icon(like.like.isEmpty
                                        ? CupertinoIcons.heart
                                        : CupertinoIcons.heart_fill))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Get.width * 0.05),
                        child: InkWell(
                          onTap: () {
                            buyitems.addandRemove(
                                like.like[index],
                                like.Title[index].toString(),
                                like.Dis[index].toString(),
                                like.Price[index],
                                like.Thumb[index].toString());

                            Get.snackbar('Added Successfully',
                                'Added To Cart Successfully',
                                dismissDirection: DismissDirection.horizontal);
                          },
                          child: Text(
                            'Add To Cart',
                            style: GoogleFonts.museoModerno(
                                fontSize: Get.width * 0.03),
                          ),
                        ),
                      ),
                    ],
                  ));
            },
          );
        }));
  }
}
