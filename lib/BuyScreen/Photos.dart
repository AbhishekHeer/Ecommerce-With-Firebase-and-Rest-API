// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dismissible_page/dismissible_page.dart';
import 'package:ecommerce/BuyScreen/DetailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShowPhotosOfProduct extends StatefulWidget {
  String image0;
  String? image1;
  String? image2;
  String? image3;
  ShowPhotosOfProduct({
    Key? key,
    required this.image0,
    required this.image1,
    required this.image2,
    required this.image3,
  }) : super(key: key);

  @override
  State<ShowPhotosOfProduct> createState() => _ShowPhotosOfProductState();
}

class _ShowPhotosOfProductState extends State<ShowPhotosOfProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.11),
      child: Column(
        children: [
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
                  image: widget.image1.toString(),
                ));
              },
              child: Image(image: NetworkImage(widget.image1.toString()))),
          GestureDetector(
              onTap: () {
                context.pushTransparentRoute(SecondPage(
                  image: widget.image2.toString(),
                ));
              },
              child: Image(image: NetworkImage(widget.image2.toString()))),
          GestureDetector(
              onTap: () {
                context.pushTransparentRoute(SecondPage(
                  image: widget.image3.toString(),
                ));
              },
              child: Image(image: NetworkImage(widget.image3.toString()))),
        ],
      ),
    );
  }
}
