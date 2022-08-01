import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/modules/homeMain_page/data/model/getPost.dart';

import '../../../../data/model/content.dart';
import '../model/Post.dart';

abstract class IHomeMainRepository {
  Future<List<GetPost>> getAllPost(String type, String email);
  Future<List<GetPost>> getPostWithContent(
      int contentId, String type, String email);
  Future<double> getDisLikesCount(int postId, String type);
  Future<double> getLikesCount(int postId, String type);
  Future<void> addPost(Post post);
  Future<List<Content>> getCompanyConent(int idCompany);
  Future<List<Brand>> getCompanyBrand(int idCompanyConent);
}
