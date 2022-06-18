import 'package:get/get.dart';

import '../controllers/conversation_page_controller.dart';

class ConversationPageBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(ConversationPageController());
  }
}
