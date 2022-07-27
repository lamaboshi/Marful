import 'package:get/get.dart';

import '../controllers/chat_page_controller.dart';

class ChatPageBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(ChatPageController());
  }
}
