import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/data/model/bascket.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';

import 'adapter/website_company_adapter.dart';
import 'model/company_dto.dart';

class WebsiteCompanyRepository implements IWebsiteCompanyRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<CompanyDto> getdata() async {
    var result = await _dio.get(
        'https://localhost:7192/api/Company/CompanyContentBrandProduct/JUICYBEAUTY@test.com');
    print('-------------------------- get CompanyDto-----------------------');
    return CompanyDto.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<List<CompanyContent>> getdatacompcontent() async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/{1}');
    print(result);
    var list = <CompanyContent>[];
    for (var item in result.data) {
      list.add(CompanyContent.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> addBasket(Basket basket) async {
    print(basket.toJson());
    var result = await _dio.post('https://localhost:7192/api/Basket',
        data: basket.toJson());
    return result.statusCode == 200;
  }
}
