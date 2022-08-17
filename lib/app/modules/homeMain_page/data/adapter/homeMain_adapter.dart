import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/modules/chat_page/data/model/job.dart';
import 'package:marful/app/modules/homeMain_page/data/model/getPost.dart';

import '../../../websit_company/data/model/companycontent.dart';
import '../model/Post.dart';
import '../model/post_infulonser.dart';
import '../model/user_post.dart';

abstract class IHomeMainRepository {
  Future<List<GetPost>> getAllPost(String type, String email);
  Future<List<GetPost>> getPostWithContent(
      int contentId, String type, String email);
  Future<double> getDisLikesCount(int postId, String type);
  Future<double> getLikesCount(int postId, String type);
  Future<void> addPost(Post post);
  Future<List<CompanyContent>> getCompanyConent(int idCompany);
  Future<List<Brand>> getCompanyBrand(int idCompanyConent);
  Future<List<PostUser>> getByUserId(int userId);
  Future<List<PostInfulonser>> getByInfoId(int infoId);
  Future<void> addInterActionUser(PostUser postUser);
  Future<void> addInterActionInf(PostInfulonser infulonser);
  Future<void> deleteInterActionUser(int idpostUser);
  Future<void> deleteInterActionInf(int idinfulonser);
  Future<List<Job>> getCompanyJob(int idbrand);
  Future<List<Job>> getInfoJob(int idInfo);
  Future<Company> getCompanyByJob(int idJob);
  Future<void> updateInterActionUser(int idpostUser, PostUser postUser);
  Future<void> updateInterActionInf(
      int idinfulonser, PostInfulonser infulonser);
  Future<Company> getCompanyByBrandId(int idBrand);
}
