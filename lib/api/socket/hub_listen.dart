import 'managment_hub.dart';

class HubListenController {
  final ManagementHub hub;
  HubListenController(this.hub);

  void run() {
    // for (var channel in ManagementHubResponses.values) {
    //   hub.connection.on(describeEnum(channel), (args) {
    //     notifications.add(ResponseNotification(describeEnum(channel), args));
    //   });
    // }
    hub.connection.on('Chats', (args) => print(args.toString()));
  }

  void end() {
    // for (var channel in ManagementHubResponses.values) {
    //   hub.connection.off(describeEnum(channel));
    // }
  }
}
