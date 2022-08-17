import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/sheard/auth_service.dart';

import '../data/company_type.dart';
import '../data/cpmpany_repo.dart';

class PermissionsPageController extends GetxController {
  final repo = CompanyTypeRepository();
  final authService = Get.find<AuthService>();
  final count = 0.obs;
  final newCompany = CompanyTypeModel().obs;
  final typeCompanyList = <CompanyTypeModel>[];
  @override
  void onInit() {
    super.onInit();
    getAllType();
  }

  Future<void> addtype() async {
    await repo.addCompanyType(newCompany.value);
    getAllType();
  }

  Future<void> deletetype(int id) async {
    await repo.deleteCompanyType(id);
    getAllType();
  }

  Future<void> getAllType() async {
    typeCompanyList.clear();
    var data = await repo
        .getCompanyType((authService.getDataFromStorage() as Company).id!);
    typeCompanyList.assignAll(data);
  }

  void increment() => count.value++;
}
