import 'package:get/get.dart';
import 'package:marful/api/socket/hub_listen.dart';
import 'package:marful/api/socket/managment_hub.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final ManagementHub hub;
  final HubListenController listener;
  HomeController({required this.hub}) : listener = HubListenController(hub);
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
  void onClose() {}
  void increment() => count.value++;
}
