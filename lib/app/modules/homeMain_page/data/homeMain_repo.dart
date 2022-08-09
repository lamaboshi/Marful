import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/modules/homeMain_page/data/adapter/homeMain_adapter.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/homeMain_page/data/model/getPost.dart';
import 'package:marful/app/modules/homeMain_page/data/model/post_infulonser.dart';
import 'package:marful/app/modules/homeMain_page/data/model/user_post.dart';

import '../../../../sheard/auth_service.dart';
import '../../websit_company/data/model/companycontent.dart';

class HomeMainRepositry extends IHomeMainRepository {
  final _dio = Get.find<Dio>();
  final auth = AuthService();

  @override
  Future<List<GetPost>> getAllPost(String type, String email) async {
    var list = <GetPost>[];
    var result = await _dio.get('https://localhost:7192/api/Main/Posts',
        queryParameters: {"Type": type, "email": email});
    print('00000000000000000000000000${result.data}');
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
    try {
      var result = await _dio.post(
        'https://localhost:7192/api/Post',
        data: post.toJson(),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<List<CompanyContent>> getCompanyConent(int idCompany) async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/$idCompany');
    print(result);
    var list = <CompanyContent>[];
    for (var item in result.data) {
      list.add(CompanyContent.fromJson(item));
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

  @override
  Future<void> addInterActionInf(PostInfulonser infulonser) async {
    var result = await _dio.post(
        'https://localhost:7192/api/PostInfulonser/AddPostInfulonser',
        data: infulonser.toJson());
  }

  @override
  Future<void> addInterActionUser(PostUser postUser) async {
    var result = await _dio.post(
        'https://localhost:7192/api/UserPost/AddUserPost',
        data: postUser.toJson());
  }

  @override
  Future<List<PostUser>> getByUserId(int userId) async {
    var result =
        await _dio.get('https://localhost:7192/api/UserPost/GetByUser/$userId');
    print(result);
    var list = <PostUser>[];
    for (var item in result.data) {
      list.add(PostUser.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<PostInfulonser>> getByInfoId(int infoId) async {
    var result = await _dio
        .get('https://localhost:7192/api/PostInfulonser/GetByInfu/$infoId');
    print(result);
    var list = <PostInfulonser>[];
    for (var item in result.data) {
      list.add(PostInfulonser.fromJson(item));
    }
    return list;
  }

  @override
  Future<void> deleteInterActionInf(int idinfulonser) async {
    var result = await _dio.delete(
        'https://localhost:7192/api/PostInfulonser/Delete/$idinfulonser');
  }

  @override
  Future<void> deleteInterActionUser(int idpostUser) async {
    var result = await _dio
        .delete('https://localhost:7192/api/UserPost/Delete/$idpostUser');
  }

  @override
  Future<void> updateInterActionInf(
      int idinfulonser, PostInfulonser infulonser) async {
    var result = await _dio.put(
        'https://localhost:7192/api/PostInfulonser/Put/$idinfulonser',
        data: infulonser.toJson());
  }

  @override
  Future<void> updateInterActionUser(int idpostUser, PostUser postUser) async {
    var result = await _dio.put(
        'https://localhost:7192/api/UserPost/Put/$idpostUser',
        data: postUser.toJson());
  }
}
