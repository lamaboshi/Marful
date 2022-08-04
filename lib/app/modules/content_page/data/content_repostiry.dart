
class ContentRepository extends IContentRepository {
  final _dio = Get.find<Dio>();
  @override
    Future<List<Content>> GetContent() async {
    var result = await _dio.get( 'https://localhost:7192/api/Content');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }

}