import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';

import 'adapter/brand_adapter.dart';

class BrandRepository extends IBrandRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> AddBrand(Brand brand) async {
    print(brand.toJson());
    var result = await _dio.post('https://localhost:7192/api/Brand',
        data: brand.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<bool> DelBrand(int id) async {
    var result = await _dio.delete('https://localhost:7192/api/Brand/$id');
    return result.statusCode == 200;
  }

  Future<List<CompanyContent>> GetCompanyConent(int idCompany) async {
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
  Future<List<Brand>> getAllBrand(int idComp) async {
    var result = await _dio
        .get('https://localhost:7192/api/Company/GetAllBarndCompany/$idComp');
    print(result);
    var list = <Brand>[];
    for (var item in result.data) {
      list.add(Brand.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Brand>> getAllBrandInfo(int idInfo) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Infulonser/GetInfulonsersBrand/$idInfo');
    print(result);
    var list = <Brand>[];
    for (var item in result.data) {
      list.add(Brand.fromJson(item));
    }
    return list;
  }
}
