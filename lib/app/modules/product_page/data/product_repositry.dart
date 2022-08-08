import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';

import 'adapter/product_adapter.dart';

class ProductRepository extends IProductRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<List<Product>> getproducts(int idbrand) async {
    var result = await _dio.get('https://localhost:7192/api/Product/idBrand',
        queryParameters: {'idBrand': idbrand});
    print(result);
    var list = <Product>[];
    for (var item in result.data) {
      list.add(Product.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> addproduct(int idbrand, Product product) async {
    var result = await _dio.post(
      'https://localhost:7192/api/Product',
      data: {"brandId": idbrand, "product": product},
    );
    return result.statusCode == 200;
  }

  @override
  Future<bool> delproduct(int idbrand, int idproduct) async {
    var result = await _dio.delete(
        'https://localhost:7192/api/Product{$idproduct}',
        data: {"idbrand": idbrand, "idproduct": idproduct});
    return result.statusCode == 200;
  }
}
