import 'package:get/get.dart';

import '../controllers/brand_page_controller.dart';

class BrandPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrandPageController>(
      () => BrandPageController(),
    );
  }
}
