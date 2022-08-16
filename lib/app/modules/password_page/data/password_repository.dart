import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'adapter/password_adapter.dart';
import 'model/rest_password.dart';

class PasswordRepository implements IPasswordRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<List<Infulonser>> getdata() async {
    var result = await _dio.get('https://localhost:7192/api/Infuloncer');
    var list = <Infulonser>[];
    for (var item in result.data) {
      list.add(Infulonser.fromJson(item));
    }
    return list;
  }

  @override
  Future<RestPassword?> getEmail(String email) async {
    var result = await _dio.get('https://localhost:7192/api/Auth/GetEmail',
        queryParameters: {"email": email});
    if (result.statusCode == 200) {
      return RestPassword.fromJson(result.data as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<bool> resetPassComp(int idCompany, String newPassword) async {
    var result = await _dio.put('https://localhost:7192/api/Company/Password',
        queryParameters: {"Id": idCompany, "password": newPassword});
    return result.statusCode == 200;
  }

  @override
  Future<bool> resetPassInful(int idInful, String newPassword) async {
    var result = await _dio.put(
        'https://localhost:7192/api/Infulonser/Password',
        queryParameters: {"Id": idInful, "password": newPassword});
    return result.statusCode == 200;
  }

  @override
  Future<bool> resetPassUser(int idUser, String newPassword) async {
    var result = await _dio.put('https://localhost:7192/api/User/Password',
        queryParameters: {"Id": idUser, "password": newPassword});
    return result.statusCode == 200;
  }
}
