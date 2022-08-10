import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:marful/app/modules/help_pagee/controllers/help_pagee_controller.dart';

class HelpPageeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(HelpPageeController());
  }
}