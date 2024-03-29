import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/deleteDialog.dart';
import 'package:marful/app/routes/app_pages.dart';

import '../../../../sheard/auth_service.dart';
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
        title: Text('Setting'.tr),
        backgroundColor: AppColors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            controller.auth.getTypeEnum() != Auth.user
                ? buildCard('Brand'.tr, Icons.settings,
                    () => Get.rootDelegate.toNamed(Routes.BRAND_PAGE))
                : const SizedBox.shrink(),
            controller.auth.getTypeEnum() != Auth.user
                ? buildCard('Content'.tr, Icons.edit,
                    () => Get.rootDelegate.toNamed(Routes.Content))
                : const SizedBox.shrink(),
            (controller.auth.getTypeEnum() == Auth.comapny &&
                        controller.auth.companyType() == 'Editing Officer') ||
                    (controller.auth.getTypeEnum() == Auth.comapny &&
                        controller.auth.companyType() == 'chat employee') ||
                    (controller.auth.getTypeEnum() == Auth.comapny &&
                        controller.auth.companyType() == 'Publishing Officer')
                ? const SizedBox.shrink()
                : buildCard('DeleteMyAccount'.tr, Icons.delete, () async {
                    Get.dialog(DeleteDialogWidget(delFunction: () async {
                      await controller.deleteAccount();
                      Get.back();
                    }));
                  }),
            controller.auth.getTypeEnum() == Auth.comapny
                ? buildCard('Permission'.tr, AppIcons.trending_up, () {
                    Get.rootDelegate.toNamed(Routes.PERMISSIONS_PAGE);
                  })
                : const SizedBox.shrink(),
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
        clipBehavior: Clip.antiAlias,
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
