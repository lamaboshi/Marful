import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
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
}
