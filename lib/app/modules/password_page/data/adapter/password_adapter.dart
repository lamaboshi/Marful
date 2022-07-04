import 'package:marful/app/data/model/infulonser.dart';

import '../model/rest_password.dart';

abstract class IPasswordRepository {
  Future<List<Infulonser>> getdata();
  Future<bool> resetPassInful(int idInful, String newPassword);
  Future<bool> resetPassComp(int idCompany, String newPassword);
  Future<bool> resetPassUser(int idUser, String newPassword);
  Future<RestPassword?> getEmail(String email);
}
