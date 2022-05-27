import 'package:signalr_core/signalr_core.dart';

class ManagementHub {
  final HubConnection connection;
  const ManagementHub({required this.connection});
  void Ping() => connection.send(methodName: 'Ping');
  Future<String> Hello() async => await connection.invoke('Hello') as String;
}
