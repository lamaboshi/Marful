import 'package:get/get.dart';

import '../controllers/firstSplash_controller.dart';

class FirstSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirstSplashController());
  }
}
