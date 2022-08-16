import '../search_model.dart';

abstract class ISearchRepository {
  Future<SearchModel> getInfulonserSearch(String name);
  Future<SearchModel> getCompanySearch(String name);
  Future<SearchModel> getBrandSearch(String name);
  Future<SearchModel> getProductSearch(String name);
  Future<SearchModel> getContentSearch(String name);
  Future<List<SearchModel>> getSearch(String name);
}
