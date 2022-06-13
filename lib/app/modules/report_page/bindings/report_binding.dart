import 'package:get/get.dart';
import 'package:marful/app/modules/report_page/controllers/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReportConteroller());
  }
}
