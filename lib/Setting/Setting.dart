import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:ecommerce/Setting/Setting_Head.dart';
import 'package:ecommerce/YourProduct/Product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = false;

  bool tuu = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SettingHead(),
            // User card
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    launchUrl(Uri.parse('https://dummyjson.com/products'));
                  },
                  icons: CupertinoIcons.italic,
                  iconStyle: IconStyle(),
                  title: 'Product',
                  subtitle: "Get API Key Of Product",
                ),
              ],
            ),

            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    Get.to(MyProduct());
                  },
                  icons: Icons.shop_2_outlined,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'Your Product',
                  subtitle: "Happy Shopping : )",
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    launchUrl(Uri.parse('https://github.com/AbhishekHeer'));
                  },
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more Devloper",
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();

                    await Navigator.pushReplacementNamed(
                        context, '/LoginScreen');
                  },
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
