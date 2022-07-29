import 'package:get/get.dart';

class HayaController extends GetxController {
  //TODO: Implement HayaController

  final count = 0.obs;
  List<String> brand=['huda beuty','narins','karen wazen','huda beuty','narins','karen wazen'];
  final selectedBrand=0.obs;
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
