import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'adapter/setting_adapter.dart';

class SettingsRepository extends ISettingsRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<bool> deleteCompanyAccount(int id) async {
    var result =
        await _dio.delete('https://localhost:7192/api/Company/Delete/$id');
    return result.statusCode == 200;
  }

  @override
  Future<bool> deleteInfluserAccount(int id) async {
    var result =
        await _dio.delete('https://localhost:7192/api/Infulonser/Delete/$id');
    return result.statusCode == 200;
  }

  @override
  Future<bool> deleteUserAccount(int id) async {
    var result =
        await _dio.delete('https://localhost:7192/api/User/Delete/$id');
    return result.statusCode == 200;
  }
}
