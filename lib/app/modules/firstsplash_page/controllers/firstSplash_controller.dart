// ignore_for_file: file_names

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class FirstSplashController extends GetxController {
  RxDouble opacity = 0.0001.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 1));
    opacity.value = 0.9;
    await Future.delayed(const Duration(seconds: 2), () {
      Get.rootDelegate.offNamed(Routes.Intro);
    });
  }


  @override
  void onClose() {}
}
