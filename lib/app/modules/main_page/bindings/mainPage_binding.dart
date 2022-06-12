import 'package:get/get.dart';
import 'package:marful/app/modules/main_page/controllers/mainPage_controller.dart';

class MainPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainPageController());
  }

}