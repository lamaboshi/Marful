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
    allCompany.value = CompanyDto();
    loading.value = true;
    var email = (Get.rootDelegate.arguments() as List<dynamic>).first;
    var data = await webRepo.getdata(email ?? 'JUICYBEAUTY@test.com');
    allCompany.value = data;
    loading.value = false;
  }

  Future<void> addBasket() async {
    userpostId.value =
        int.parse((Get.rootDelegate.arguments() as List<dynamic>).last);
    var res = false;
    for (var item in allProduct.toList()) {
      var basket = Basket(
          productId: item.id,
          userPostId: userpostId.value == 0 ? null : userpostId.value,
          totalPrice: double.parse((item.price! *
                  count[allProduct.indexOf(item).isNegative
                      ? 0
                      : allProduct.indexOf(item)])
              .toString()));
      res = await webRepo.addBasket(basket);
    }
  }
}
