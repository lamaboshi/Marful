import 'package:get/get.dart';
import 'package:marful/app/modules/homePost_page/controllers/homePost_controller.dart';

class HomePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePostController());
  }
}
