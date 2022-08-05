import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/report_page/views/report_view.dart';
import 'package:marful/app/modules/setting_page/views/setting_page_view.dart';
import '../../../core/values/my_flutter_app_icons.dart';
import '../../profile/views/edit_profile.dart';

class HomeMenuView extends StatelessWidget {
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
            buildCard('Report', AppIcons.trending_up,
                () => Get.to(() => const ReportView())),
            buildCard('About', Icons.abc_outlined, () {}),
            buildCard('Log out', Icons.delete, () {}),
            buildCard('Log out', Icons.logout, () {}),
          ],
        ),
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
