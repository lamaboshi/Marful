import 'package:get/get.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
import 'package:marful/app/modules/websit_company/data/model/company.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';

import '../data/websit_company_repository.dart';

class WebsitcompanyController extends GetxController {
  final webRepo = WebsiteCompanyRepository();
  var allProducts = <Product>[].obs;
   var companys = Company().obs;
    var allcompanyscontent = <CompanyContent>[].obs;
  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getcompany();
    getAllProduct();
  }

  Future<void> getAllProduct() async {
    loading.value = true;
    var data = await webRepo.getdata();
    allProducts.assignAll(data);
    loading.value = false;
  }
  Future<void> getcompany() async {
    loading.value = true;
    var data = await webRepo.getdatacompany(1);
    companys.value=data;
    loading.value = false;
  }
 
}
