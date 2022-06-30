import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/homeMain_page/data/adapter/homeMain_adapter.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';

class HomeMainRepositry extends IHomeMainRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<List<Post>> getPostData(Post object) async {
    var result = await _dio.get('https://localhost:7192/api/Post');
    print(result);
    var list = <Post>[];
    for (var item in result.data) {
      list.add(Post.fromJson(item));
    }
    return list;
  }
}
