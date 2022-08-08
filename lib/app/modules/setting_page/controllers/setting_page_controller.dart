import 'package:get/get.dart';
import 'package:marful/sheard/auth_service.dart';

class SettingPageController extends GetxController {
  final auth = Get.find<AuthService>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
