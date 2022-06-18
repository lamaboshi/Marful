import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';

import '../data/websit_company_repository.dart';

class WebsitcompanyController extends GetxController {
  final webRepo = WebsiteCompanyRepository();
  var allProducts = <Product>[].obs;
   var allcompanys = <Company>[].obs;
    var allcompanyscontent = <CompanyContent>[].obs;
  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getAllProduct();
  }

  Future<void> getAllProduct() async {
    loading.value = true;
    var data = await webRepo.getdata();
    allProducts.assignAll(data);
    loading.value = false;
  }
  Future<void> getAllcompany() async {
    loading.value = true;
    var data = await webRepo.getdatacompany();
    allcompanys.assignAll(data);
    loading.value = false;
  }
    Future<void> getAllcompanyContent() async {
    loading.value = true;
    var data = await webRepo.getdatacompcontent();
    allcompanyscontent.assignAll(data);
    loading.value = false;
  }
}
