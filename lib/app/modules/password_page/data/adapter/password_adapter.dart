import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/modules/password_page/data/password_repository.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';


class PasswordRepository implements IPasswordRepository{
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
}