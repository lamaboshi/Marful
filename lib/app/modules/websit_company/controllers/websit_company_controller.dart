import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';

import '../data/websit_company_repository.dart';

class WebsitcompanyController extends GetxController {
  final webRepo = WebsiteCompanyRepository();
  var allProducts = <Product>[].obs;
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
}
