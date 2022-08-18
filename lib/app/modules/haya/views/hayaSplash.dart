import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/haya/controllers/haya_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/my_flutter_app_icons.dart';

class HayaMenu extends GetView<HayaController> {
  const HayaMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: [
                  const Text('English'),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeTrackColor: AppColors.orange,
                    activeColor: AppColors.orange,
                  ),
                  const Text('عربي'),
                ],
              ),
              buildCard('Editprofil'.tr, Icons.edit),
              buildCard('Setting'.tr, Icons.settings),
              //   buildCard('Report', AppIcons.trending_up, ()=> Get.to(() =>const ReportView())),
              buildCard('Help'.tr, AppIcons.help_outline),
              buildCard(
                'Logout'.tr,
                Icons.logout,
              )
            ])));
  }

  Widget buildCard(String title, IconData icon) {
    return SizedBox(
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
    );
  }
}
