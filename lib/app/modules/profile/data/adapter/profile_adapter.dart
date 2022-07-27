import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';

import '../../../../data/model/content.dart';

abstract class IProfailRepository {
Future<List<Content>> GetInfulConent(int IdInful);
Future<List<Content>> GetCompanyConent(int idCompany);
Future<List<Post>>GetInfulPost(int idInful);
Future<List<Post>>GetCompPost(int idCompany);
Future<bool>Updateinfo(Infulonser infulonser ,int id);
Future<bool>Updatecomp(Company company,int id);
Future<bool>Updateuse(UserModel userModel,int id);
Future<bool>AddcontentInfulonser(int idInful,int idcontent);
Future<bool>AddcontentCompany(int idCompany,int idcontent);
Future<bool>DeletcontentInfulonser(int idInful,int idcontent);
Future<bool>DeletcontentCompany(int idCompany,int idcontent);
}