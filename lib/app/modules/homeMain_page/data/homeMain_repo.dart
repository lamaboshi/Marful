import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/modules/homeMain_page/data/adapter/homeMain_adapter.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/homeMain_page/data/model/getPost.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/content.dart';

class HomeMainRepositry extends IHomeMainRepository {
  final _dio = Get.find<Dio>();
  final auth = AuthService();

  @override
  Future<List<GetPost>> getAllPost(String type, String email) async {
    var list = <GetPost>[];
    var result = await _dio.get('https://localhost:7192/api/Main/Posts',
        queryParameters: {"Type": type, "email": email});
    print(result.data);
    if (result.statusCode == 404) return [];
    for (var item in result.data) {
      list.add(GetPost.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<GetPost>> getPostWithContent(
      int contentId, String type, String email) async {
    var result = await _dio.get('https://localhost:7192/api/Main/PostsContent',
        queryParameters: {"id": contentId, "email": email, "Type": type});
    var list = <GetPost>[];
    for (var item in result.data) {
      print(item);
      list.add(GetPost.fromJson(item));
    }
    return list;
  }

  @override
  Future<double> getDisLikesCount(int postId, String type) async {
    var result = await _dio.get('https://localhost:7192/api/Main/GeDistLikes',
        queryParameters: {"id": postId, "Type": type});
    return double.parse(result.data.toString());
  }

  @override
  Future<double> getLikesCount(int postId, String type) async {
    var result = await _dio.get('https://localhost:7192/api/Main/GetLikes',
        queryParameters: {"id": postId, "Type": type});
    return double.parse(result.data.toString());
  }

  @override
  Future<void> addPost(Post post) async {
    print(post.toJson().toString());
    var result = await _dio.post(
      'https://localhost:7192/api/Post',
      data: post.toJson(),
    );
  }

  @override
  Future<List<Content>> getCompanyConent(int idCompany) async {
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
  Future<List<Brand>> getCompanyBrand(int idCompanyConent) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Company/GetAllBarndCompany/$idCompanyConent');
    print(result);
    var list = <Brand>[];
    for (var item in result.data) {
      list.add(Brand.fromJson(item));
    }
    return list;
  }
}
