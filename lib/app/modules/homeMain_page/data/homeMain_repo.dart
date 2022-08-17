import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/modules/chat_page/data/model/job.dart';
import 'package:marful/app/modules/homeMain_page/data/adapter/homeMain_adapter.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/homeMain_page/data/model/getPost.dart';
import 'package:marful/app/modules/homeMain_page/data/model/post_infulonser.dart';
import 'package:marful/app/modules/homeMain_page/data/model/user_post.dart';

import '../../../../sheard/auth_service.dart';
import '../../websit_company/data/model/companycontent.dart';

class HomeMainRepositry extends IHomeMainRepository {
  final _dio = Get.find<Dio>();
  final auth = AuthService();

  @override
  Future<List<GetPost>> getAllPost(String type, String email) async {
    var list = <GetPost>[];
    var result = await _dio.get('https://localhost:7192/api/Main/Posts',
        queryParameters: {"Type": type, "email": email});
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(GetPost.fromJson(item));
      }
      return list;
    }
    return [];
  }

  @override
  Future<List<GetPost>> getPostWithContent(
      int contentId, String type, String email) async {
    var result = await _dio.get('https://localhost:7192/api/Main/PostsContent',
        queryParameters: {"id": contentId, "email": email, "Type": type});
    var list = <GetPost>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(GetPost.fromJson(item));
      }
    }

    return list;
  }

  @override
  Future<double> getDisLikesCount(int postId, String type) async {
    var result = await _dio.get('https://localhost:7192/api/Main/GeDistLikes',
        queryParameters: {"id": postId, "Type": type});
    if (result.statusCode == 200) {
      return double.parse(result.data.toString());
    }
    return 0;
  }

  @override
  Future<double> getLikesCount(int postId, String type) async {
    var result = await _dio.get('https://localhost:7192/api/Main/GetLikes',
        queryParameters: {"id": postId, "Type": type});
    if (result.statusCode == 200) {
      return double.parse(result.data.toString());
    }
    return 0;
  }

  @override
  Future<void> addPost(Post post) async {
    print(post.toJson().toString());
    try {
      var result = await _dio.post(
        'https://localhost:7192/api/Post',
        data: post.toJson(),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<CompanyContent>> getCompanyConent(int idCompany) async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/$idCompany');
    var list = <CompanyContent>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(CompanyContent.fromJson(item));
      }
    }

    return list;
  }

  @override
  Future<List<Brand>> getCompanyBrand(int idCompanyConent) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Company/GetAllBarndCompany/$idCompanyConent');
    var list = <Brand>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(Brand.fromJson(item));
      }
    }

    return list;
  }

  @override
  Future<void> addInterActionInf(PostInfulonser infulonser) async {
    var result = await _dio.post(
        'https://localhost:7192/api/PostInfulonser/AddPostInfulonser',
        data: infulonser.toJson());
  }

  @override
  Future<void> addInterActionUser(PostUser postUser) async {
    var result = await _dio.post(
        'https://localhost:7192/api/UserPost/AddUserPost',
        data: postUser.toJson());
  }

  @override
  Future<List<PostUser>> getByUserId(int userId) async {
    var result =
        await _dio.get('https://localhost:7192/api/UserPost/GetByUser/$userId');
    var list = <PostUser>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(PostUser.fromJson(item));
      }
    }

    return list;
  }

  @override
  Future<List<PostInfulonser>> getByInfoId(int infoId) async {
    var result = await _dio
        .get('https://localhost:7192/api/PostInfulonser/GetByInfu/$infoId');
    print(result);
    var list = <PostInfulonser>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(PostInfulonser.fromJson(item));
      }
    }

    return list;
  }

  @override
  Future<void> deleteInterActionInf(int idinfulonser) async {
    var result = await _dio.delete(
        'https://localhost:7192/api/PostInfulonser/Delete/$idinfulonser');
  }

  @override
  Future<void> deleteInterActionUser(int idpostUser) async {
    var result = await _dio
        .delete('https://localhost:7192/api/UserPost/Delete/$idpostUser');
  }

  @override
  Future<void> updateInterActionInf(
      int idinfulonser, PostInfulonser infulonser) async {
    var result = await _dio.put(
        'https://localhost:7192/api/PostInfulonser/Put/$idinfulonser',
        data: infulonser.toJson());
  }

  @override
  Future<void> updateInterActionUser(int idpostUser, PostUser postUser) async {
    var result = await _dio.put(
        'https://localhost:7192/api/UserPost/Put/$idpostUser',
        data: postUser.toJson());
  }

  @override
  Future<List<Job>> getCompanyJob(int idbrand) async {
    var result = await _dio
        .get('https://localhost:7192/api/Job/GetJobsCompany/$idbrand');
    var list = <Job>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(Job.fromJson(item));
      }
    }
    return list;
  }

  @override
  Future<List<Job>> getInfoJob(int idInfo) async {
    var result = await _dio.get('https://localhost:7192/api/Job/Get/$idInfo');
    print(result);
    var list = <Job>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(Job.fromJson(item));
      }
    }
    print(
        '--------------------------------------get all Job----------------------------------------------');
    return list;
  }

  @override
  Future<Company> getCompanyByJob(int idJob) async {
    var result =
        await _dio.get('https://localhost:7192/api/Job/GetCompany/$idJob');
    if (result.statusCode == 200) {
      return Company.fromJson(result.data as Map<String, dynamic>);
    }
    return Company();
  }
}
