import 'package:get/get.dart';
import 'package:marful/app/modules/search_page/controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}
