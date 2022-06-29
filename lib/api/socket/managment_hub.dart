import 'package:marful/app/modules/conversation_page/data/model/conversation_model.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../app/modules/chat_page/data/model/message_model.dart';

class ManagementHub {
  final HubConnection connection;
  const ManagementHub({required this.connection});
  void Ping() => connection.send(methodName: 'Ping');
  Future<String> Hello() async => await connection.invoke('Hello') as String;
  Future<List<ConversationModel>> GA_Conversations() async {
    var json = await connection.invoke('GA_Conversations');
    return List<ConversationModel>.from(
        json.map((x) => ConversationModel.fromJson(x as Map<String, dynamic>))
            as Iterable);
  }

  Future<List<MessageModel>> GA_Messages(int idConvo) async {
    var json = await connection.invoke('GA_Messages', args: [idConvo]);
    return List<MessageModel>.from(
        json.map((x) => MessageModel.fromJson(x as Map<String, dynamic>))
            as Iterable);
  }
}
