import 'package:get/get.dart';
import 'package:marful/app/modules/intro_page/view/intro_view.dart';

import '../../../routes/app_pages.dart';

class FirstSplashController extends GetxController {
 
  RxDouble opacity = 0.0001.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 1));
    opacity.value = 0.9;
    await Future.delayed(const Duration(seconds: 3), () {
      Get.rootDelegate.offNamed(Routes.Intro);
     //  Get.to(IntroPage());
    
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
