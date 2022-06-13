import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // final hubConnection = HubConnectionBuilder()
    //     .withUrl(
    //       'https://localhost:7192/management-hub',
    //       HttpConnectionOptions(
    //         transport: HttpTransportType.webSockets,
    //         logMessageContent: true,
    //         logging: (level, message) => print(message),
    //       ),
    //     )
    //     .build();

    // try {
    //   await hubConnection.start();
    // } on Exception catch (e) {
    //   if (e.toString().contains('401')) {
    //     await hubConnection.start();
    //   }
    // }
    // hubConnection.onclose((error) {
    //   print("Connection Closed $error");
    // });
    // Get.lazyPut<HomeController>(
    //   () => HomeController(hub: ManagementHub(connection: hubConnection)),
    // );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
