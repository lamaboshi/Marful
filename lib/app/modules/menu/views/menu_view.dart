import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/routes/app_pages.dart';

import '../../../core/values/my_flutter_app_icons.dart';

class HomeMenuView extends StatelessWidget {
  const HomeMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildCard('Edit profil', Icons.edit, Routes.EditProfile),
            buildCard('Setting', Icons.settings, Routes.Setting),
            buildCard('Report', AppIcons.trending_up, Routes.Report),
            buildCard('About', Icons.abc_outlined, ''),
            buildCard('Log out', Icons.logout, ''),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, IconData icon, String namePage) {
    return InkWell(
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
      onTap: () {
        if (namePage.isNotEmpty) {
          Get.rootDelegate.toNamed(namePage);
        }
      },
    );
  }
}
