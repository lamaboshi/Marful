import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/password_page/data/password_repository.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';

class PasswordRepository implements IPasswordRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<List<Infulonser>> getdata() async {
    var result = await _dio.get('https://localhost:7192/api/Infuloncer');
    print(result);
    var list = <Infulonser>[];
    for (var item in result.data) {
      list.add(Infulonser.fromJson(item));
    }
    return list;
  }
    @override
  Future <String> getEmail(String email) async {
    var result = await _dio.get('https://localhost:7192/api/Auth/GetEmail', 
     queryParameters:{"email":email});
    print(result);
    var typevalue;
   if(result.statusCode==200){
    typevalue=result.data;
   }
  return typevalue;
  }
    @override
  Future resetPassInful(Infulonser infulonser ) async {
    var result = await _dio.put('https://localhost:7192/api/Infulonser',
    queryParameters: {"infulonser":infulonser});
    result:infulonser.toJson();
  }
  @override
   Future resetPassComp(Company company ) async {
    var result= await _dio.put('https://localhost:7192/api/Company',
    queryParameters: {"company":company});
    result: company.toJson();
  }
   @override
   Future resetPassUser(UserModel userModel ) async {
    var result = await _dio.put('https://localhost:7192/api/User/Password',
    queryParameters: {"userModel":userModel});
    result:userModel.toJson();
  }
}
