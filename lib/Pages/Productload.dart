import 'package:ecommerce/Getx/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/BuyScreen/DetailPage.dart';
import 'package:ecommerce/Getx/get.dart';

// ignore: must_be_immutable
class ProductLoad extends StatefulWidget {
  String search;
  ProductLoad({
    Key? key,
    required this.search,
  }) : super(key: key);

  @override
  State<ProductLoad> createState() => _ProductLoadState();
}

MyController items = Get.put(MyController());
Likeproduct like = Get.put(Likeproduct());
ThumbController thumb = Get.put(ThumbController());

BuyitemController buyitem = Get.put(BuyitemController());

class _ProductLoadState extends State<ProductLoad> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.63,
      child: Obx(() {
        return items.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.8,
                ),
                itemCount: items.model?.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final title = items.model!.products[index].title.toString();

                  if (widget.search.isEmpty ||
                      title
                          .toLowerCase()
                          .contains(widget.search.toLowerCase())) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(DetailPage(
                              thumb: items.model!.products[index].thumbnail
                                  .toString(),
                              rating:
                                  items.model!.products[index].rating.toInt(),
                              dicc: items.model!.products[index].description
                                  .toString(),
                              image0: items.model!.products[index].images[0]
                                  .toString(),
                              image1: items.model!.products[index].images[1]
                                  .toString(),
                              image2: items.model!.products[index].images[2]
                                  .toString(),
                              image3: items.model!.products[index].images[3]
                                  .toString(),
                              price:
                                  items.model!.products[index].price.toString(),
                              title:
                                  items.model!.products[index].title.toString(),
                            ));
                          },
                          child: Hero(
                            tag: 'pic',
                            child: Image(
                              image: NetworkImage(items
                                  .model!.products[index].thumbnail
                                  .toString()),
                              fit: BoxFit.contain,
                              height: Get.height * 0.2,
                              width: Get.width,
                            ),
                          ),
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
                                    items.model!.products[index].title
                                        .toString(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              CupertinoIcons.star_fill)),
                                      Text(items.model!.products[index].rating
                                          .toString()),
                                    ],
                                  ),
                                  Obx(() {
                                    return IconButton(
                                        onPressed: () {
                                          if (like.like.contains(index)) {
                                            like.removeproduct(
                                              index,
                                              title,
                                              items.model!.products[index]
                                                  .description
                                                  .toString(),
                                              items
                                                  .model!.products[index].price,
                                              items.model!.products[index]
                                                  .thumbnail
                                                  .toString(),
                                            );
                                          } else {
                                            like.addproduct(
                                              index,
                                              title,
                                              items.model!.products[index]
                                                  .description
                                                  .toString(),
                                              items
                                                  .model!.products[index].price,
                                              items.model!.products[index]
                                                  .thumbnail
                                                  .toString(),
                                            );
                                          }
                                        },
                                        icon: Icon(like.like.contains(index)
                                            ? CupertinoIcons.heart_fill
                                            : CupertinoIcons.heart));
                                  })
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Get.width * 0.05),
                          child: Text(
                            '${items.model!.products[index].description.substring(0, 40).toString()}...',
                            style: GoogleFonts.museoModerno(
                                fontSize: Get.width * 0.03),
                          ),
                        ),

                        //price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Obx(() => Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        if (thumb.like.contains(index)) {
                                          thumb.down(
                                            index,
                                          );
                                        } else {
                                          thumb.up(
                                            index,
                                          );
                                        }
                                      },
                                      icon: Icon(thumb.like.contains(index)
                                          ? CupertinoIcons.hand_thumbsup_fill
                                          : CupertinoIcons.hand_thumbsup),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.08,
                                    ),
                                  ],
                                )),
                            InkWell(
                              onTap: () {
                                PaymentController().bottomsheet(
                                    context,
                                    title,
                                    items.model!.products[index].price
                                        .toString());
                                // payment
                              },
                              child: Container(
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.25,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: Get.width * 0.002,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          Get.height * 0.02),
                                      color: Colors.transparent),
                                  child: Center(
                                    child: Text(
                                        '\$${items.model!.products[index].price}'),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),

                        // shop cart
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Obx(() => InkWell(
                                  onTap: () {
                                    buyitem.addandRemove(
                                      index,
                                      title,
                                      items.model!.products[index]
                                          .description[index]
                                          .toString(),
                                      items.model!.products[index].price,
                                      items.model!.products[index].thumbnail
                                          .toString(),
                                    );
                                  },
                                  child: Container(
                                    height: Get.height * 0.06,
                                    width: Get.width * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Get.height * 0.05),
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            colors: [
                                              Colors.redAccent,
                                              Colors.blueAccent
                                            ])),
                                    child: Center(
                                      child: Icon(buyitem.items.contains(index)
                                          ? Icons.done
                                          : CupertinoIcons.shopping_cart),
                                    ),
                                  ),
                                ))
                          ],
                        )
                      ],
                    );
                  }
                  return null;
                },
              );
      }),
    );
  }
}
