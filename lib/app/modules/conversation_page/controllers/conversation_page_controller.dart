import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../../api/socket/hub_listen.dart';
import '../../../../api/socket/managment_hub.dart';
import '../data/model/conversation_model.dart';

class ConversationPageController extends GetxController {
  late ManagementHub hub;
  late HubListenController listener;
  final allConversations = <ConversationModel>[].obs;
  final loading = false.obs;

  Future<void> conactionhub() async {
    final hubConnection = HubConnectionBuilder()
        .withUrl(
          'https://localhost:7192/management-hub',
          HttpConnectionOptions(
            transport: HttpTransportType.webSockets,
            logMessageContent: true,
            logging: (level, message) => print(message),
          ),
        )
        .build();

    try {
      await hubConnection.start();
    } on Exception catch (e) {
      if (e.toString().contains('401')) {
        await hubConnection.start();
      }
    }

    hubConnection.onclose((error) {
      print("Connection Closed $error");
    });
    hub = ManagementHub(connection: hubConnection);
    listener = HubListenController(hub);
    getAllConversations();
  }

  @override
  void onInit() {
    conactionhub();

    super.onInit();
  }

  Future<void> getAllConversations() async {
    allConversations.clear();
    loading.value = true;
    var result = await hub.GA_Conversations();
    allConversations.addAll(result);
    loading.value = false;
  }

  @override
  void onClose() {}
}
