import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/content.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/infulonsercontent.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';

import 'adapter/profile_adapter.dart';

class ProfailRepository extends IProfailRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<List<Content>> GetCompanyConent(int idCompany) async {
    var result = await _dio
        .get('https://localhost:7192/api/CompanyContent/{$idCompany}');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Content>> GetInfulConent(int idInful) async {
    var result =
        await _dio.get('https://localhost:7192/api/InfulonserContent/$idInful');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Post>> GetInfulPost(int idInful) async {
    var result = await _dio
        .get('https://localhost:7192/api/Infulonser/GetAllPosts/$idInful');
    print(result);
    var list = <Post>[];
    for (var item in result.data) {
      list.add(Post.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Post>> GetCompPost(int idCompany) async {
    var result = await _dio
        .get('https://localhost:7192/api/Company/GetAllPosts/$idCompany');
    print(result);
    var list = <Post>[];
    for (var item in result.data) {
      list.add(Post.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> Updateinfo(Infulonser infulonser, int id) async {
    var result = await _dio.put(
      'https://localhost:7192/api/Infulonser/Put/$id',
      data: infulonser.toJson(),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> Updatecomp(Company company, int id) async {
    var result = await _dio.put(
      'https://localhost:7192/api/Company/Put/$id',
      data: company.toJson(),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> Updateuse(UserModel userModel, int id) async {
    var result = await _dio.put(
      'https://localhost:7192/api/User/Put/$id',
      data: userModel.toJson(),
    );
    return result.statusCode == 200;
  }
  @override
  Future<bool> AddcontentInfulonser(int idInful, int idcontent) async {
    var result = await _dio.post(
      'https://localhost:7192/api/InfulonserContent',
      data: {"id": 0, "infulonserId": idInful, "contentId": idcontent},
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> AddcontentCompany(int idCompany, int idcontent) async {
    var result = await _dio.post(
      'https://localhost:7192/api/CompanyContent',
      data: {"id": 0, "companyId": idCompany, "contentId": idcontent},
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> DeletcontentInfulonser(int idcontentInfo) async {
    var result = await _dio.delete(
        'https://localhost:7192/api/InfulonserContent',
        data: {"id": idcontentInfo});
    return result.statusCode == 200;
  }

  @override
  Future<bool> DeletcontentCompany(int idcontentComp) async {
    var result = await _dio.delete('https://localhost:7192/api/CompanyContent',
       data: {"id": idcontentComp});
    return result.statusCode == 200;
  }
}
