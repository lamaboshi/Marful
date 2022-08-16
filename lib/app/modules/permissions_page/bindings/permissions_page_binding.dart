import 'package:get/get.dart';

import '../controllers/permissions_page_controller.dart';

class PermissionsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionsPageController>(
      () => PermissionsPageController(),
    );
  }
}
