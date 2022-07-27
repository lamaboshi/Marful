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

  Future<void> SendMessage(String text,int idConv,bool iscCompa) async {
    await connection.invoke('SendMessage', args: [text,idConv,iscCompa]);
  }

  Future<List<Message>> GA_Messages(int idConvo) async {
    var json = await connection.invoke('GA_Messages', args: [idConvo]);

    return List<Message>.from(json
        .map((x) => Message.fromJson(x as Map<String, dynamic>)) as Iterable);
  }
}
