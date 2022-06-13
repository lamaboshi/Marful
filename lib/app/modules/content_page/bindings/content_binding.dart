import 'package:get/get.dart';
import 'package:marful/app/modules/content_page/controllers/content_controller.dart';

class ContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContentController());
  }
}
