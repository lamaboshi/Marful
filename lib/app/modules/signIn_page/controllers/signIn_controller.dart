import 'package:get/get.dart';

import '../../../../api/storge/storge_service.dart';
import '../../../../sheard/auth_service.dart';
import '../../../routes/app_pages.dart';

class SignInController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final authService = Get.find<AuthService>();
  final stroge = Get.find<StorageService>();
  final count = 0.obs;
  final isShown = false.obs;
  Future<void> logIn() async {
    await authService.logIn(email.value, password.value);
    if (!stroge.containsKey('type')) {
      return;
    }
    Get.rootDelegate.offNamed(Routes.HOME);
  }
}
