import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/homeMain_page/data/adapter/homeMain_adapter.dart';
import 'package:marful/app/modules/homeMain_page/data/model/getPost.dart';

import '../../../../sheard/auth_service.dart';

class HomeMainRepositry extends IHomeMainRepository {
  final _dio = Get.find<Dio>();
  final auth = AuthService();

  @override
  Future<List<GetPost>> getAllPost(String type, String email) async {
    var list = <GetPost>[];
    var result = await _dio.get('https://localhost:7192/api/Main/Posts',
        queryParameters: {"Type": type, "email": email});
    print(result.data);
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
}
