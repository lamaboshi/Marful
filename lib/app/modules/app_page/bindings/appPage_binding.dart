import 'package:get/get.dart';
import 'package:marful/app/modules/app_page/controllers/appPage_controller.dart';

class AppPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppPageController());
  }
}
