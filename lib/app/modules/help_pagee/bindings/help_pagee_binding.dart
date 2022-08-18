import 'package:get/get.dart';
import 'package:marful/app/modules/help_pagee/controllers/help_pagee_controller.dart';

class HelpPageeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HelpPageeController());
  }
}