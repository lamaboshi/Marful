import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/content.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/profile/data/Infu_follow.dart';
import 'package:marful/app/modules/profile/data/company_ifu.dart';
import 'package:marful/app/modules/profile/data/company_user.dart';
import 'package:marful/app/modules/profile/data/user_infu.dart';

import '../../websit_company/data/model/companycontent.dart';
import 'adapter/profile_adapter.dart';
import 'model_data.dart';

class ProfailRepository extends IProfailRepository {
  final _dio = Get.find<Dio>();
  Future<List<CompanyContent>> getCompanyConent(int idCompany) async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/$idCompany');
    print(result);
    var list = <CompanyContent>[];
    for (var item in result.data) {
      list.add(CompanyContent.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Content>> GetInfulConent(int idInful) async {
    var result =
        await _dio.get('https://localhost:7192/api/InfulonserContent/$idInful');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Post>> GetInfulPost(int idInful) async {
    var result = await _dio
        .get('https://localhost:7192/api/Infulonser/GetAllPosts/$idInful');
    var list = <Post>[];
    for (var item in result.data) {
      list.add(Post.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Post>> GetCompPost(int idCompany) async {
    var result = await _dio
        .get('https://localhost:7192/api/Company/GetAllPosts/$idCompany');

    var list = <Post>[];
    for (var item in result.data) {
      list.add(Post.fromJson(item));
    }
    print(
        '--------------------------------------------------------Get Post Company Done-------------------------------');
    return list;
  }

  @override
  Future<bool> Updateinfo(Infulonser infulonser, int id) async {
    print(infulonser.toJson());
    var result = await _dio.put(
      'https://localhost:7192/api/Infulonser/Put/$id',
      data: infulonser.toJson(),
    );
    return result.statusCode == 405;
  }

  @override
  Future<bool> Updatecomp(Company company, int id) async {
    var result = await _dio.put(
      'https://localhost:7192/api/Company/Put/$id',
      data: company.toJson(),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> Updateuse(UserModel userModel, int id) async {
    var result = await _dio.put(
      'https://localhost:7192/api/User/Put/$id',
      data: userModel.toJson(),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> AddcontentCompany(int idCompany, int idcontent) async {
    var result = await _dio.post(
      'https://localhost:7192/api/CompanyContent',
      data: {"id": 0, "companyId": idCompany, "contentId": idcontent},
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> AddcontentInfulonser(int idInful, int idcontent) async {
    var result = await _dio.post(
      'https://localhost:7192/api/InfulonserContent',
      data: {"id": 0, "infulonserId": idInful, "contentId": idcontent},
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> DeletcontentCompany(int idcontentComp, int idCom) async {
    var result = await _dio.delete(
        'https://localhost:7192/api/CompanyContent/$idcontentComp/$idCom');
    return result.statusCode == 200;
  }

  @override
  Future<bool> DeletcontentInfulonser(int idcontentInfo, int idInu) async {
    var result = await _dio.delete(
        'https://localhost:7192/api/InfulonserContent/$idcontentInfo/$idInu');
    return result.statusCode == 200;
  }

  @override
  Future<List<ModelData>> getAllFollowInfu(String email) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Infulonser/GetFollowers',
        queryParameters: {'email': email});
    var list = <ModelData>[];
    for (var item in result.data) {
      list.add(ModelData.fromJson(item));
    }
    print(
        '--------------------------------------------------------Get getAllFollowInfu Done-------------------------------');
    return list;
  }

  @override
  Future<List<ModelData>> getAllFollowCompany(String email) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Company/GetFollowers',
        queryParameters: {'email': email});
    var list = <ModelData>[];
    for (var item in result.data) {
      list.add(ModelData.fromJson(item));
    }
    print(
        '--------------------------------------------------------Get getAllFollowCompany Done-------------------------------');
    return list;
  }

  @override
  Future<int> getCountFollowInfu(String email) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Infulonser/GetFollowersCount',
        queryParameters: {'email': email});
    print(
        '--------------------------------------------------------Get getCountFollowInfu Done-------------------------------');
    return result.data;
  }

  @override
  Future<int> getCountFollowCompany(String email) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Company/GetFollowersCount',
        queryParameters: {'email': email});
    print(
        '--------------------------------------------------------Get getCountFollowCompany Done-------------------------------');
    return result.data;
  }

  @override
  Future<bool> DeletPost(int idPost) async {
    var result = await _dio.delete(
      'https://localhost:7192/api/Post/$idPost',
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> UpdatePost(int idPost, Post post) async {
    var result = await _dio.put('https://localhost:7192/api/Post/$idPost',
        data: post.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<bool> addInfuFollowedInfu(
      InfulonserFollowInfulonser followInfulonser) async {
    var result = await _dio.post(
      'https://localhost:7192/api/InfulonserFollowInfulonser',
      data: followInfulonser.toJson(),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> adduserCompany(UserCompany userCompany) async {
    var result = await _dio.post(
      'https://localhost:7192/api/UserCompany/AddUserCompany',
      data: userCompany.toJson(),
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> adduserInfo(InfulonserUser infulonserUser) async {
    var result = await _dio.post(
      'https://localhost:7192/api/InfulonserUser/AddInfulonserUser',
      data: infulonserUser.toJson(),
    );
    return result.statusCode == 200;
  }

  @override
  Future<InfulonserFollowInfulonser> getInfuFollowedInfu(int idfllow) async {
    var result = await _dio
        .get('https://localhost:7192/api/InfulonserFollowInfulonser/$idfllow');
    if (result.data != null) {
      return InfulonserFollowInfulonser.fromJson(
          result.data as Map<String, dynamic>);
    } else {
      return InfulonserFollowInfulonser();
    }
  }

  @override
  Future<UserCompany> getuserCompany(int userId) async {
    var result = await _dio
        .get('https://localhost:7192/api/UserCompany/GetUserCompany/$userId');
    print(
        '-------------------------------- getuserCompany ------------------------------');
    return UserCompany.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<InfulonserUser> getuserInfo(int userId) async {
    var result = await _dio.get(
        'https://localhost:7192/api/InfulonserUser/GetInfilonserUser/$userId');
    print(
        '-------------------------------- getuserInfo ------------------------------');
    return InfulonserUser.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<bool> addCompanyInfulonser(CompanyInfulonser companyInfulonser) async {
    var result = await _dio.post(
      'https://localhost:7192/api/CompanyInfulonser',
      data: companyInfulonser.toJson(),
    );
    return result.statusCode == 200;
  }

  @override
  Future<CompanyInfulonser> getCompanyInfulonser(
      int idCompany, int idInfu) async {
    var result = await _dio
        .get('https://localhost:7192/api/CompanyInfulonser/$idCompany/$idInfu');
    if (result.data != null) {
      return CompanyInfulonser.fromJson(result.data as Map<String, dynamic>);
    } else {
      return CompanyInfulonser();
    }
  }
}
