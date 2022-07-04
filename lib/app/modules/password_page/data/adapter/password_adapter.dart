import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/password_page/data/password_repository.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';

import '../model/rest_password.dart';

abstract class IPasswordRepository {
  Future<List<Infulonser>> getdata();
  Future<bool> resetPassInful(int idInful, String newPassword);
  Future<bool> resetPassComp(int idCompany, String newPassword);
  Future<bool> resetPassUser(int idUser, String newPassword);
  Future<RestPassword?> getEmail(String email);
}
