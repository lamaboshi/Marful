import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/homeMain_page/data/adapter/homeMain_adapter.dart';
import 'package:marful/app/modules/homeMain_page/data/model/getPost.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/user_model.dart';

class HomeMainRepositry extends IHomeMainRepository {
  final _dio = Get.find<Dio>();
  final auth = AuthService();

  @override
  Future<List<GetPost>> getAllPost() async {
    var user = auth.getDataFromStorage();
    if (user is UserModel) {
      String? email = user.email;

      var result = await _dio.get('https://localhost:7192/api/Main/Posts',
          queryParameters: {"email": email});
      print(result);
      var list = <GetPost>[];
      for (var item in result.data) {
        list.add(GetPost.fromJson(item));
      }
      return list;
    }
    return [];
  }

  @override
  Future<List<GetPost>> getPostWithContent(int contentId) async {
    var user = auth.getDataFromStorage();
    if (user is UserModel) {
      String? email = user.email;

      var result = await _dio.get(
          'https://localhost:7192/api/Main/PostsContent',
          queryParameters: {"id": contentId, "email": email});
      print(result);
      var list = <GetPost>[];
      for (var item in result.data) {
        list.add(GetPost.fromJson(item));
      }
      return list;
    }
    return [];
  }
}
