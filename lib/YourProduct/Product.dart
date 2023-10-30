import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProduct extends StatelessWidget {
  MyProduct({super.key});

  final _db = FirebaseDatabase.instance.ref('Product');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Product'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<DatabaseEvent>(
                stream: _db.onValue,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, mainAxisExtent: Get.height * .4),
                      itemCount: snapshot.data?.snapshot.children.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map<dynamic, dynamic> map =
                            snapshot.data?.snapshot.value as dynamic;
                        List<dynamic> items0 = [];
                        items0.clear();
                        final items = map.values.toList();

                        return Container(
                            margin: EdgeInsets.symmetric(
                              vertical: Get.height * .02,
                              horizontal: Get.width * .03,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: Get.width * .0004,
                                    color: Colors.white)),
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image: NetworkImage(items[index]['thumb']),
                                  fit: BoxFit.contain,
                                  width: Get.width,
                                  height: Get.height * .2,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * .07,
                                      vertical: Get.width * .02),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        items[index]['title'],
                                        style: GoogleFonts.niramit(
                                            fontSize: Get.width * .05),
                                      )),
                                ),
                                SizedBox(
                                  height: Get.height * .03,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: Get.height * .05,
                                      width: Get.width * .24,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Get.width * 0.06),
                                          border: Border.all(
                                              width: Get.width * .0004,
                                              color: Colors.white)),
                                      child: Center(
                                        child:
                                            Text('\$ ${items[index]['price']}'),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ));
                      },
                    );
                  }
                })),
          ),
        ],
      ),
    );
  }
}
