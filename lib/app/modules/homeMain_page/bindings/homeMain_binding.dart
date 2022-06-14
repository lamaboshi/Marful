import 'package:get/get.dart';
import 'package:marful/app/modules/homeMain_page/controllers/homeMain_controller.dart';

class HomeMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeMainController());
  }
}
