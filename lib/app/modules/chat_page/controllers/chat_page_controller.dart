import 'package:get/get.dart';

import '../../../../api/socket/managment_hub.dart';

class ChatPageController extends GetxController {
  final hub = Get.find<ManagementHub>();
  @override
  void onInit() {
    var data = int.parse(Get.arguments);
    hub.GA_Messages(data);
    super.onInit();
  }
}
