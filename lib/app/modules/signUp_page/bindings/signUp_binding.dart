import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/controllers/signUp_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
