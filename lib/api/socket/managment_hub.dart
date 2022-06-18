import 'package:marful/app/modules/conversation_page/data/model/conversation_model.dart';
import 'package:signalr_core/signalr_core.dart';

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
}
