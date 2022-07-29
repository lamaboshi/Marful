import 'package:get/get.dart';

class ContentController extends GetxController {
  final count = 0.obs;
  final type = [
    'comidy',
    'fashon',
    'hfgbv',
    'hfgh',
    'comidy',
    'fashon',
    'hfgbv',
    'hfgh',
    'comidy',
    'fashon',
    'hfgbv',
    'hfgh',
    'comidy',
    'fashon',
    'hfgbv',
    'hfgh',
  ].obs;

  @override
  void onInit() {
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
