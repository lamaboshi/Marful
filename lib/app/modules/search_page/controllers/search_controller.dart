import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/content.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/modules/search_page/data/search_repositry.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/brand.dart';

class SearchController extends GetxController {
    final authService = Get.find<AuthService>();
    final Repo=SearchRepository();
    final inputvalue=''.obs;
    final infulonser=Infulonser().obs;
    final company=Company().obs;
    final brand=Brand().obs;
    final product=Product().obs;
    final content=Content().obs;
    final List<Map<String, String>> all = [
    {"name": "Ghaith Marwan", "sort": "influencer"},
    {"name": "Narin", "sort": "influencer"},
    {"name": "Nour Stars", "sort": "influencer"},
    {"name": "Huda buaty", "sort": "company"},
    {"name": "Zara", "sort": "company"},
    {"name": "haya Eid", "sort": "user"},
    {"name": "Channel", "sort": "brand"},
  ];
  //empty
  Rx<List<Map<String, String>>> find = Rx<List<Map<String, String>>>([]);
 
  @override
  void onInit() {
    super.onInit();
    find.value = all;
  }

  Future<void> getcompany(String value) async {
    var data = await Repo.getCompanySearch(value);
    company.value=data;
  }
 Future<void> getInfulonser(String value) async {
    var data = await Repo.getInfulonserSearch(value);
    infulonser.value=data;
  }
 Future<void> getcontent(String value) async {
    var data = await Repo.getContentSearch(value);
    content.value=data;
  }
 Future<void> getBrand(String value) async {
    var data = await Repo.getBrandSearch(value);
    brand.value=data;
  }
 Future<void> getproduct(String value) async {
    var data = await Repo.getProductSearch(value);
    product.value=data;
  }


  @override
  void filter(String name) {
    List<Map<String, String>> results = [];
    if (name.isEmpty) {
      results = all;
    } else {
      results = all
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(name.toLowerCase()))
          .toList();
      find.value = results;
    }
  }

 
}
