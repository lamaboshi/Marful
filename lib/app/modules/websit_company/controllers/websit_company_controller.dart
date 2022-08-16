import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
import 'package:marful/app/modules/websit_company/data/model/bascket.dart';
import 'package:marful/app/modules/websit_company/data/model/company_dto.dart';

import '../data/websit_company_repository.dart';

class WebsitcompanyController extends GetxController {
  final webRepo = WebsiteCompanyRepository();
  var allCompany = CompanyDto().obs;
  var companys = Company().obs;
  var userpostId = 0.obs;
  final idbrand = 0.obs;
  var allProduct = <Product>[].obs;
  var count = <int>[].obs;
  final totle = 0.obs;
  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  Future<void> getAll() async {
    loading.value = true;
    var data = await webRepo.getdata();
    allCompany.value = data;
    loading.value = false;
  }

  Future<void> addBasket() async {
    print(Get.rootDelegate.arguments().toString());
    userpostId.value = int.parse(Get.rootDelegate.arguments().toString());
    var res = false;
    for (var item in allProduct.toList()) {
      var basket = Basket(
          productId: item.id,
          userPostId: userpostId.value,
          totalPrice: double.parse((item.price! *
                  count[allProduct.indexOf(item).isNegative
                      ? 0
                      : allProduct.indexOf(item)])
              .toString()));
      res = await webRepo.addBasket(basket);
    }
  }
}
