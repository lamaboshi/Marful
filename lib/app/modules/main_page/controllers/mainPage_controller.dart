import 'package:get/get.dart';

class MainPageController extends GetxController{
  final count = 0.obs;
  final isShown = false.obs;
  @override
  void onInit() {
    print('ffffffff');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}