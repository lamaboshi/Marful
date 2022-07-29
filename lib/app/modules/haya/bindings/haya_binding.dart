import 'package:get/get.dart';

import '../controllers/haya_controller.dart';

class HayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HayaController>(
      () => HayaController(),
    );
  }
}
