import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/content.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';

import 'adapter/profile_adapter.dart';

class ProfailRepository extends IProfailRepository{
    final _dio = Get.find<Dio>();
  @override
  Future<List<Content>> GetCompanyConent(int idCompany) async {
    var result = await _dio.get('https://localhost:7192/api/CompanyContent/{$idCompany}');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }
  @override
  Future<List<Content>> GetInfulConent(int idInful) async {
    var result = await _dio.get('https://localhost:7192/api/InfulonserContent/{$idInful}');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }
  @override
  Future<List<Post>> GetInfulPost(int idInful) async {
    var result = await _dio.get('https://localhost:7192/api/Infulonser/GetAllPosts/{$idInful}');
    print(result);
    var list = <Post>[];
    for (var item in result.data) {
      list.add(Post.fromJson(item));
    }
    return list;
  }  
  @override
  Future<List<Post>> GetCompPost(int idCompany) async {
    var result = await _dio.get('https://localhost:7192/api/Company/GetAllPosts/{$idCompany}');
    print(result);
    var list = <Post>[];
    for (var item in result.data) {
      list.add(Post.fromJson(item));
    }
    return list;
  }
}