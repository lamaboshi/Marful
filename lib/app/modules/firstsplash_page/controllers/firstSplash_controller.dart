import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class FirstSplashController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
   RxDouble opacity = 0.0001 .obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds:1));
    opacity.value=0.9;
  await  Future.delayed(const Duration(seconds:3), () {
      Get.toNamed(Routes.Intro);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
