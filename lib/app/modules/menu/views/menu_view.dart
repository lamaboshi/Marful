import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/setting_page/views/setting_page_view.dart';
import 'package:marful/app/routes/app_pages.dart';

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
                () => Get.to(() => const SettingPageView())),
            //buildCard('Report', AppIcons.trending_up, ()=> Get.to(() =>const ReportView())),
            //buildCard('About', Icons.abc_outlined, () {}),
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
