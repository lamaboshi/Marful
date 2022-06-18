import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';
import 'adapter/website_company_adapter.dart';

class WebsiteCompanyRepository implements IWebsiteCompanyRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<List<Product>> getdata() async {
    var result = await _dio.get('https://localhost:7192/api/Product');
    print(result);
    var list = <Product>[];
    for (var item in result.data) {
      list.add(Product.fromJson(item));
    }
    return list;
  }
    Future<List<Company>> getdatacompany() async {
    var result = await _dio.get('https://localhost:7192/api/Company');
    print(result);
    var list = <Company>[];
    for (var item in result.data) {
      list.add(Company.fromJson(item));
    }
    return list;
  }
    Future<List<CompanyContent>> getdatacompcontent() async {
    var result = await _dio.get('https://localhost:7192/api/CompanyContent/{1}');
    print(result);
    var list = <CompanyContent>[];
    for (var item in result.data) {
      list.add(CompanyContent.fromJson(item));
    }
    return list;
  }
}
