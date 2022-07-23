import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/signUp_page/data/adapter/user_adapter.dart';

class UserRepository extends IUserRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<bool> regierterUser(UserModel object) async {
    var data = await _dio.post('https://localhost:7192/api/User/AddUser',
        data: object.toJson());
    if (data.statusCode == 200) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }
}
