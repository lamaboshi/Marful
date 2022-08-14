import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/profile/data/Infu_follow.dart';
import 'package:marful/app/modules/profile/data/company_user.dart';
import 'package:marful/app/modules/profile/data/model_data.dart';
import 'package:marful/app/modules/profile/data/user_infu.dart';

import '../../../../data/model/content.dart';
import '../../../websit_company/data/model/companycontent.dart';
import '../company_ifu.dart';

abstract class IProfailRepository {
  Future<List<Content>> GetInfulConent(int IdInful);
  Future<List<CompanyContent>> getCompanyConent(int idCompany);
  Future<List<Post>> GetInfulPost(int idInful);
  Future<List<Post>> GetCompPost(int idCompany);
  Future<int> getCountFollowInfu(String email);
  Future<List<ModelData>> getAllFollowInfu(String email);
  Future<int> getCountFollowCompany(String email);
  Future<List<ModelData>> getAllFollowCompany(String email);
  Future<bool> Updateinfo(Infulonser infulonser, int id);
  Future<bool> Updatecomp(Company company, int id);
  Future<bool> Updateuse(UserModel userModel, int id);
  Future<bool> AddcontentInfulonser(int idInful, int idcontent);
  Future<bool> AddcontentCompany(int idCompany, int idcontent);
  Future<bool> DeletcontentInfulonser(int idcontentInfo, int idInu);
  Future<bool> DeletcontentCompany(int idcontentComp, int idcomp);
  Future<bool> DeletPost(int idPost);
  Future<bool> UpdatePost(int idPost, Post post);
  Future<bool> adduserInfo(InfulonserUser infulonserUser);
  Future<bool> adduserCompany(UserCompany userCompany);
  Future<bool> addInfuFollowedInfu(InfulonserFollowInfulonser followInfulonser);
  Future<bool> addCompanyInfulonser(CompanyInfulonser companyInfulonser);

  Future<InfulonserUser> getuserInfo(int userId);
  Future<UserCompany> getuserCompany(int userId);
  Future<InfulonserFollowInfulonser> getInfuFollowedInfu(int idfllow);
  Future<CompanyInfulonser> getCompanyInfulonser(int idCompany, int idInfu);
}
