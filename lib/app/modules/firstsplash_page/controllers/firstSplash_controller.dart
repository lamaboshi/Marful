import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class FirstSplashController extends GetxController {
  RxDouble opacity = 0.0001.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 1));
    opacity.value = 0.9;
<<<<<<< HEAD
    await Future.delayed(const Duration(seconds: 3), () {
    //  Get.rootDelegate.offNamed(Routes.Intro);
   Get.to(IntroPage());
    
=======
    await Future.delayed(const Duration(seconds: 2), () {
      Get.rootDelegate.offNamed(Routes.Intro);
      //  Get.to(IntroPage());
>>>>>>> 70e5b71ee6244c1163c61b743d8e9d255b930c46
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
