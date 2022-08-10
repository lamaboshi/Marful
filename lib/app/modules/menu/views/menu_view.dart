import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/routes/app_pages.dart';

import '../../../core/values/h.dart';
import '../../../core/values/my_flutter_app_icons.dart';
import '../../help_pagee/views/help_pagee_view.dart';
import '../../profile/views/edit_profile.dart';
import '../controllers/menu_controller.dart';

class HomeMenuView extends GetView<MenuController> {
  const HomeMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildCard(
                'Edit profil', Icons.edit, () => Get.to(EditProfilePage())),
            buildCard('Setting', Icons.settings,
<<<<<<< HEAD
                () => Get.to(() => const SettingPageView())),
            //   buildCard('Report', AppIcons.trending_up, ()=> Get.to(() =>const ReportView())),
            buildCard('Help',  AppIcons.help_outline, () {
              Get.to(HelpPageeView());
            }),
            buildCard('About', Icons.abc_outlined, () {}),  buildCard('Delete account', Icons.delete, () {
              controller.auth.stroge.deleteAllKeys();
              Get.rootDelegate.toNamed(Routes.SignIn);
            }),
=======
                () => Get.rootDelegate.toNamed(Routes.SETTING_PAGE)),
>>>>>>> 38d6e4b0e2195d4bf5505e88344264f435041b7b
            buildCard('Log out', Icons.logout, () {
              controller.auth.stroge.deleteAllKeys();
              Get.rootDelegate.toNamed(Routes.SignIn);
            }),
          ],
        ),
      ),
    );
  }

  Widget viewPart(String name, String descraption) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Obx(() => ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/8.jpg',
                    width: 200,
                    height: 200,
                  ),
                )),
          ),
          Center(
              child: Text(
            name == null ? '' : name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }

  Widget buildCard(String title, IconData icon, Function()? namePage) {
    return InkWell(
      onTap: namePage,
      child: SizedBox(
        height: 80,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
