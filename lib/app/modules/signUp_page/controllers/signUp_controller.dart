import 'package:get/get.dart';

class SignUpController extends GetxController {
  final count = 0.obs;
  final isShownUser = false.obs;
  final isShownInfluencer = false.obs;
  final isShownCompany = false.obs;

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
