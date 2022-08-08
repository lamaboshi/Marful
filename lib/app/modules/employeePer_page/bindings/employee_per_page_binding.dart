import 'package:get/get.dart';

import '../controllers/employee_per_page_controller.dart';

class EmployeePerPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeePerPageController>(
      () => EmployeePerPageController(),
    );
  }
}
