import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(Get.width * 0.04),
                child: const SearchBar(
                  leading: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.clear),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
