import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../api/storge/storge_service.dart';
import '../../../../sheard/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../view/company_type.dart';

class SignInController extends GetxController {
    String? forceValue(String? value) {
    if (value == null || value.isEmpty) {
      return 'requird';
    }
    return null;
  }
  final form = GlobalKey<FormState>();
  final email = ''.obs;
  final password = ''.obs;
  final typeCompany = ''.obs;
  final authService = Get.find<AuthService>();
  final stroge = Get.find<StorageService>();
  final count = 0.obs;
  final isShown = true.obs;
  final typeCompanyList = [
    'chat employee',
    'Publishing Officer',
    'Editing Officer',
    'Owner'
  ];
  Future<void> logInTypeFun() async {
    await authService.logInType(typeCompany.value, password.value);
    if (!stroge.containsKey('CompanyType')) {
      return;
    }
    Get.rootDelegate.offNamed(Routes.HOME);
  }

  Future<void> logIn() async {
    await authService.logIn(email.value, password.value);
    if (!stroge.containsKey('type')) {
      return;
    }
    if (authService.getTypeEnum() == Auth.comapny) {
      Get.to(const CompanyType());
    } else {
      Get.rootDelegate.offNamed(Routes.HOME);
    }
  }
}
