import 'package:get/get.dart';
import 'package:marful/app/core/component/lists_extensions.dart';
import 'package:marful/app/modules/chat_page/data/model/message_model.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../../api/socket/hub_listen.dart';
import '../../../../api/socket/managment_hub.dart';
import '../../../../sheard/auth_service.dart';

class ChatPageController extends GetxController {
  //////
  /// //true for Company false for Inful
  ///
  late ManagementHub hub;
  late HubListenController listener;
  final typeAuth = Auth.user.obs;
  final auth = Get.find<AuthService>();
  final allMessage = <Message>[].obs;
  final textMessage = ''.obs;
  final convId = 0.obs;
  @override
  void onInit() {
    conactionhub();
    typeAuth.value = auth.getTypeEnum();
    hub.connection.on(
      'SendMessage',
      (arguments) {
        final data = Message.fromJson(arguments!.first as Map<String, dynamic>);
        allMessage.addOrRepLace(data);
      },
    );
    super.onInit();
  }

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
    hub = Get.put<ManagementHub>(ManagementHub(connection: hubConnection));
    listener = HubListenController(hub);
    getAllMessage();
  }

  Future<void> addMessage() async {
    var result = await hub.SendMessage(
        textMessage.value, convId.value, typeAuth.value == Auth.comapny);
    textMessage.value = '';
  }

  Future<void> getAllMessage() async {
    int id = int.parse(Get.rootDelegate.arguments().toString());
    var result = await hub.GA_Messages(id);
    allMessage.assignAll(result);
    convId.value = allMessage.first.conversationId!;
  }
}
