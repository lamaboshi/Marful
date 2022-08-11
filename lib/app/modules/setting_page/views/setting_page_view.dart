import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/routes/app_pages.dart';
import '../../../../sheard/auth_service.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/h.dart';
import '../../../core/values/my_flutter_app_icons.dart';
import '../../content_page/views/content_view.dart';
import '../../haya/views/haya_brand.dart';
import '../../permission_page/views/permission_page_view.dart';
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
            // buildCard(
            //     'Content', Icons.edit, () => Get.to(() => const ContentView())),
            // buildCard(
            //     'Brand', Icons.edit, () => Get.to(() => const HayaBrand())),
            // buildCard('Permissions', Icons.edit, () {
            //   Get.to(const PermissionPageView());

            controller.auth.getTypeEnum() == Auth.comapny
                ? buildCard('Brand', Icons.settings,
                    () => Get.rootDelegate.toNamed(Routes.BRAND_PAGE))
                : SizedBox.shrink(),
            controller.auth.getTypeEnum() != Auth.user
                ? buildCard('Content', Icons.edit,
                    () => Get.rootDelegate.toNamed(Routes.Content))
                : SizedBox.shrink(),
            buildCard('About', Icons.abc_outlined, () {}),
            buildCard('Delete My Account', Icons.delete, () {
              controller.deleteAccount();
            }),
            buildCard('Permission', AppIcons.trending_up, () {
              Get.to(PermissionPageView());
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
