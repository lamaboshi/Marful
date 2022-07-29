import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/brand_page/views/brand_page_view.dart';
import 'package:marful/app/modules/content_page/views/content_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/my_flutter_app_icons.dart';
import '../controllers/setting_page_controller.dart';

class SettingPageView extends GetView<SettingPageController> {
  const SettingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Setting'),
        backgroundColor: AppColors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildCard(
                'Content', Icons.edit, () => Get.to(() => const ContentView())),
            buildCard('Brand', Icons.settings, ()=> Get.to(() => const BrandPageView())),
            buildCard('Edit', AppIcons.trending_up, () {}),
         
            Expanded(
              flex: 5,
              child: Image.asset(
                'assets/images/Personal settings (1).gif',
              ),
            ),
          ],
        ),
      ),
    );
  }
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
