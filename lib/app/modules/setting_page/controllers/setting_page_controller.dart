import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/sheard/auth_service.dart';

import '../../../routes/app_pages.dart';
import '../data/setting_repository.dart';

class SettingPageController extends GetxController {
  final auth = Get.find<AuthService>();
  final repo = SettingsRepository();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> deleteAccount() async {
    bool res = false;
    if (auth.getTypeEnum() == Auth.comapny) {
      var id = (auth.getDataFromStorage() as Company).id!;
      res = await repo.deleteCompanyAccount(id);
    } else if (auth.getTypeEnum() == Auth.infulonser) {
      var id = (auth.getDataFromStorage() as Infulonser).id!;
      res = await repo.deleteInfluserAccount(id);
    } else if (auth.getTypeEnum() == Auth.user) {
      var id = (auth.getDataFromStorage() as UserModel).id!;
      res = await repo.deleteUserAccount(id);
    }
    if (res) {
      auth.stroge.deleteAllKeys();
      Get.rootDelegate.offAndToNamed(Routes.SignIn);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
