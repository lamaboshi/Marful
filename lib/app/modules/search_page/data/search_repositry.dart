import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/content.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';

import '../../../data/model/company.dart';
import '../../prpduct/data/adapter/product_adapter.dart';
import 'adapter/search_adapter.dart';
class SearchRepository extends ISearchRepository {
  final _dio = Get.find<Dio>();
  
  @override
   Future<Infulonser>getInfulonserSearch(String name) async {
  var result = await _dio.get(   'https://localhost:7192/api/Search/SearchInfulonser',
      queryParameters:{"name":name});
    print(result);
    return Infulonser.fromJson(result.data as Map<String,dynamic>);
  }
  
    @override
   Future<Company>getCompanySearch(String name) async {
  var result = await _dio.get( 'https://localhost:7192/api/Search/SearchCompany',
      queryParameters:{"name":name});
    print(result);
    return Company.fromJson(result.data as Map<String,dynamic>);
  }
  
     @override
   Future<Content>getContentSearch(String name) async {
  var result = await _dio.get( 'https://localhost:7192/api/Search/SearchContent',
      queryParameters:{"name":name});
    print(result);
    return Content.fromJson(result.data as Map<String,dynamic>);
  }
  
     @override
   Future<Brand>getBrandSearch(String name) async {
  var result = await _dio.get(  'https://localhost:7192/api/Search/SearchBrand',
      queryParameters:{"name":name});
    print(result);
    return Brand.fromJson(result.data as Map<String,dynamic>);
  }
   @override
  Future<Product>getProductSearch(String name) async {
  var result = await _dio.get(  'https://localhost:7192/api/Search/SearchProduct',
      queryParameters:{"name":name});
    print(result);
    return Product.fromJson(result.data as Map<String,dynamic>);
  }

  }