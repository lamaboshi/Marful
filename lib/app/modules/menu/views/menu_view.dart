import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/values/app_colors.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/routes/app_pages.dart';
import 'package:marful/sheard/auth_service.dart';

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
            controller.auth.getTypeEnum() == Auth.user
                ? viewPart(
                    (controller.auth.getDataFromStorage() as UserModel).name!,
                    (controller.auth.getDataFromStorage() as UserModel).image)
                : const SizedBox.shrink(),

            buildCard(
                'Edit profil', Icons.edit, () => Get.to(EditProfilePage())),
            buildCard('Setting', Icons.settings,
                () => Get.rootDelegate.toNamed(Routes.SETTING_PAGE)),
            //   buildCard('Report', AppIcons.trending_up, ()=> Get.to(() =>const ReportView())),
            buildCard('Help', AppIcons.help_outline, () {
              Get.to(const HelpPageeView());
            }),
            buildCard('About', Icons.abc_outlined, () {}),
            buildCard('Log out', Icons.logout, () {
              Get.dialog(AlertDialog(
                content: Row(
                  children: const [
                    Icon(
                      Icons.info_outlined,
                      color: AppColors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Are you sure want to LogOut ?'),
                  ],
                ),
                contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                actionsPadding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                actions: [
                  Row(children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.auth.stroge.deleteAllKeys();
                        Get.rootDelegate.toNamed(Routes.SignIn);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.blue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: const Text('Yes'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.blue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: const Text('Cancel'),
                    ),
                  ]),
                ],
              ));
              controller.auth.stroge.deleteAllKeys();
              Get.rootDelegate.toNamed(Routes.SignIn);
            }),
          ],
        ),
      ),
    );
  }

  Widget viewPart(String name, Uint8List? image) {
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
            name ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
