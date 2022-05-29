import 'package:get/get.dart';
import 'package:marful/app/modules/intro_page/controllers/intro_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IntroController());
  }
}
