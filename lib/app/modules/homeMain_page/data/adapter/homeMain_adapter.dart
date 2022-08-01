import 'package:marful/app/modules/homeMain_page/data/model/getPost.dart';

import '../model/Post.dart';

abstract class IHomeMainRepository {
  Future<List<GetPost>> getAllPost(String type, String email);
  Future<List<GetPost>> getPostWithContent(
      int contentId, String type, String email);
  Future<double> getDisLikesCount(int postId, String type);
  Future<double> getLikesCount(int postId, String type);
  Future<void> addPost(Post post);
}
