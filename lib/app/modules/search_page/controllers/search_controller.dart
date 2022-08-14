import 'package:get/get.dart';
import 'package:marful/app/modules/search_page/data/search_repositry.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/brand.dart';
import '../../../data/model/company.dart';
import '../../../data/model/content.dart';
import '../../../data/model/infulonser.dart';
import '../../websit_company/data/model/Product.dart';

class SearchController extends GetxController {
  final authService = Get.find<AuthService>();
  final Repo = SearchRepository();
  final inputvalue = ''.obs;
  final type = ''.obs;
  final infulonser = <Infulonser>[].obs;
  final company = <Company>[].obs;
  final brand = <Brand>[].obs;
  final product = <Product>[].obs;
  final content = <Content>[].obs;
  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void getSearsh() {
    loading.value = true;
    company.clear();
    brand.clear();
    infulonser.clear();
    product.clear();
    content.clear();
    if (type.value == 'brand') {
      getBrand(inputvalue.value);
    } else if (type.value == 'product') {
      getproduct(inputvalue.value);
    } else if (type.value == 'company') {
      getcompany(inputvalue.value);
    } else if (type.value == 'infulonser') {
      getInfulonser(inputvalue.value);
    } else if (type.value == 'content') {
      getcontent(inputvalue.value);
    }
    loading.value = false;
  }

  Future<void> getcompany(String value) async {
    var data = await Repo.getCompanySearch(value);
    if (data.type == 'company') {
      company.addAll(data.search as List<Company>);
    }
  }

  Future<void> getInfulonser(String value) async {
    var data = await Repo.getInfulonserSearch(value);
    if (data.type == 'infulonser') {
      infulonser.addAll(data.search as List<Infulonser>);
    }
  }

  Future<void> getcontent(String value) async {
    var data = await Repo.getContentSearch(value);
    if (data.type == 'content') {
      content.addAll(data.search as List<Content>);
    }
  }

  Future<void> getBrand(String value) async {
    var data = await Repo.getBrandSearch(value);
    if (data.type == 'brand') {
      brand.addAll(data.search as List<Brand>);
    }
  }

  Future<void> getproduct(String value) async {
    var data = await Repo.getProductSearch(value);
    if (data.type == 'product') {
      product.addAll(data.search as List<Product>);
    }
  }
}
