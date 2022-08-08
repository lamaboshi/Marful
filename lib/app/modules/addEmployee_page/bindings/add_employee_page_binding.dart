import 'package:get/get.dart';

import '../controllers/add_employee_page_controller.dart';

class AddEmployeePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEmployeePageController>(
      () => AddEmployeePageController(),
    );
  }
}
