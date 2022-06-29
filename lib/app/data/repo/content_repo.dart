import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../adapter/content_adapter.dart';
import '../model/content.dart';

class ContenteRpository implements IContenteRpository {
  final _dio = Get.find<Dio>();
  @override
  Future<List<Content>> getContent() async {
    var result = await _dio.get('https://localhost:7192/api/Content');
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }
}
