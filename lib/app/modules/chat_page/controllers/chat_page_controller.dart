import 'package:get/get.dart';
import 'package:marful/app/core/component/lists_extensions.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/content.dart';
import 'package:marful/app/modules/chat_page/data/model/message_model.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../../api/socket/hub_listen.dart';
import '../../../../api/socket/managment_hub.dart';
import '../../../../sheard/auth_service.dart';
import '../../conversation_page/data/model/conversation_model.dart';
import '../data/model/chat_page_repository.dart';
import '../data/model/job.dart';

class ChatPageController extends GetxController {
  //////
  /// //true for Company false for Inful
  ///
  late ManagementHub hub;
  late HubListenController listener;
  final typeAuth = Auth.user.obs;
  final auth = Get.find<AuthService>();
  final allMessage = <Message>[].obs;
  final brands = <Brand>[].obs;
  final companyContent = <CompanyContent>[].obs;
  final selectMessage = <Message>[].obs;
  final allConversations = ConversationModel().obs;
  final textMessage = ''.obs;
  final convId = 0.obs;
  final selectbrand = Brand(name: '').obs;
  final selectcompanyContent = CompanyContent(content: Content(name: '')).obs;
  final newJob = Job().obs;
  final isLoading = false.obs;
  final repo = ChatPageRepository();
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
    isLoading.value = false;
    super.onInit();
  }

  Future<void> addJob() async {
    newJob.value.infulonserId = allConversations.value.infulonserId;
    newJob.value.brandId = selectbrand.value.id;
    newJob.value.messages = selectMessage.toList();
    await repo.addJob(newJob.value);
  }

  Future<void> conactionhub() async {
    isLoading.value = true;
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
    getAllConversations();
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

  Future<void> getAllBrand(int idContentCom) async {
    var result = await repo.getAllBrand(idContentCom);
    brands.assignAll(result);
  }

  Future<void> getAllCompanyContent() async {
    var result = await repo.getCompanyConent(allConversations.value.companyId!);
    companyContent.assignAll(result);
    print(
        '--------------------------- getAllCompanyContent Chat-----------------');
  }

  Future<void> getAllConversations() async {
    var result = await hub.GA_Conversations();
    allConversations.value =
        result.where((element) => element.id == convId.value).first;
  }
}
