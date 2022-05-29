import 'package:get/get.dart';

import '../controllers/websit_company_controller.dart';

class WebsitcompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebsitcompanyController>(
      () => WebsitcompanyController(),
    );
  }
}
