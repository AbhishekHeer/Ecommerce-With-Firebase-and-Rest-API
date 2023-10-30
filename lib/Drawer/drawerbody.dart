import 'package:ecommerce/Drawer/drawerhead.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyDrawer extends StatefulWidget {
  const BodyDrawer({super.key});

  @override
  State<BodyDrawer> createState() => _BodyDrawerState();
}

final _db = FirebaseDatabase.instance.ref('detail');

class _BodyDrawerState extends State<BodyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: HeadDrawer()),
          ListTile(
            onTap: () {
              Get.back();
            },
            title: const Text('Home'),
            trailing: const Icon(CupertinoIcons.home),
          ),
          ListTile(
            onTap: () {
              Get.toNamed('/setting');
            },
            title: const Text('Setting'),
            trailing: const Icon(CupertinoIcons.settings),
          ),
          ListTile(
            onTap: () {
              Get.toNamed('/LoginScreen');
              FirebaseAuth.instance.signOut();
            },
            title: const Text('LogOut'),
            trailing: const Icon(CupertinoIcons.right_chevron),
          ),
        ],
      ),
    );
  }
}
