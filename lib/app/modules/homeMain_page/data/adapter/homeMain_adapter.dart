
import 'package:marful/app/modules/homeMain_page/data/model/getPost.dart';

abstract class IHomeMainRepository {
  Future<List<GetPost>> getAllPost();
  Future<List<GetPost>> getPostWithContent(int contentId);
}
