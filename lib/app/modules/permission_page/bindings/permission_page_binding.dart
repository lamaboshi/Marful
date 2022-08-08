import 'package:get/get.dart';

import '../controllers/permission_page_controller.dart';

class PermissionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionPageController>(
      () => PermissionPageController(),
    );
  }
}
