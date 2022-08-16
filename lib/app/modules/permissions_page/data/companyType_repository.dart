import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/sheard/auth_service.dart';

import 'companyType_adapter.dart';
import 'company_type.dart';

class CompanyTypeRepository extends ICompanyTypeRepository {
  final _dio = Get.find<Dio>();
  final auth = AuthService();

  @override
  Future<void> addCompanyType(CompanyTypeModel companyType) async {
    try {
      var result = await _dio.post(
        'https://localhost:7192/api/CompanyType/AddCompanyType',
        data: companyType.toJson(),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> deleteCompanyType(int idcompanyType) async {
    try {
      var result = await _dio.delete(
        'https://localhost:7192/api/CompanyType/Delete/$idcompanyType',
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<CompanyTypeModel>> getCompanyType(int idcompany) async {
    var list = <CompanyTypeModel>[];
    var result = await _dio.get(
        'https://localhost:7192/api/CompanyType/GetTypes',
        queryParameters: {'IdCmp': idcompany});
    if (result.statusCode == 404) return [];
    for (var item in result.data) {
      list.add(CompanyTypeModel.fromJson(item));
    }
    return list;
  }
}
