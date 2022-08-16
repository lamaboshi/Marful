import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/permissions_page/views/permissions_page_view.dart';
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
        title:  Text('Setting'.tr),
        backgroundColor: AppColors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            controller.auth.getTypeEnum() == Auth.comapny
                ? buildCard('Brand'.tr, Icons.settings,
                    () => Get.rootDelegate.toNamed(Routes.BRAND_PAGE))
                : SizedBox.shrink(),
            controller.auth.getTypeEnum() != Auth.user
                ? buildCard('Content'.tr, Icons.edit,
                    () => Get.rootDelegate.toNamed(Routes.Content))
                : SizedBox.shrink(),
<<<<<<< HEAD
            buildCard('About'.tr, Icons.abc_outlined, () {}),
            buildCard('DeleteMyAccount'.tr, Icons.delete, () {}),
            buildCard('buildPostEdit'.tr, AppIcons.trending_up, () {
              Get.to(PermissionPageView());
=======
            buildCard('About', Icons.abc_outlined, () {}),
            buildCard('Delete My Account', Icons.delete, () {
              controller.deleteAccount();
            }),
            buildCard('Permission', AppIcons.trending_up, () {
              Get.to(PermissionsPageView());
>>>>>>> 43d837c95ce2aa383c5368a4426259af07ae4e26
            }),
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
