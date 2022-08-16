import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'adapter/search_adapter.dart';
import 'search_model.dart';

class SearchRepository extends ISearchRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<SearchModel> getInfulonserSearch(String name) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Search/SearchInfulonser',
        queryParameters: {"search": name});
    print(result);
    return SearchModel.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<SearchModel> getCompanySearch(String name) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Search/SearchCompany',
        queryParameters: {"search": name});
    print(result);
    return SearchModel.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<SearchModel> getContentSearch(String name) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Search/SearchContent',
        queryParameters: {"search": name});
    print(result);
    return SearchModel.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<SearchModel> getBrandSearch(String name) async {
    var result = await _dio.get('https://localhost:7192/api/Search/SearchBrand',
        queryParameters: {"search": name});
    print(result);
    return SearchModel.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<SearchModel> getProductSearch(String name) async {
    var result = await _dio.get(
        'https://localhost:7192/api/Search/SearchProduct',
        queryParameters: {"search": name});
    print(result);
    return SearchModel.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<List<SearchModel>> getSearch(String name) async {
    var list = <SearchModel>[];
    var result = await _dio.get('https://localhost:7192/api/Search/Search',
        queryParameters: {"search": name});
    if (result.statusCode == 404) return [];
    for (var item in result.data) {
      list.add(SearchModel.fromJson(item));
    }
    return list;
  }
}
