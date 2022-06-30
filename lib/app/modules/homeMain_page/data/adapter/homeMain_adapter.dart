import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';

abstract class IHomeMainRepository {
  Future<List<Post>> getPostData(Post object);
}
