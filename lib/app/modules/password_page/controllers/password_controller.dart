import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';
import '../../../../api/storge/storge_service.dart';
import '../../../../sheard/auth_service.dart';
import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../data/model/rest_password.dart';
import '../data/password_repository.dart';
import '../views/confirm_password.dart';

class PasswordController extends GetxController {
  final repo = PasswordRepository();
  final resrtpassword = ''.obs;
  final password = ''.obs;
  final email = ''.obs;
  final restModel = RestPassword().obs;
  final authService = Get.find<AuthService>();
  final stroge = Get.find<StorageService>();
  Future<void> getEmail() async {
    var data = await repo.getEmail(email.value);
    if (data != null) {
      restModel.value = data;
      Get.to(() =>const Confirmpassword());
    }
  }

  Future<void> resetPassword() async {
    final result = false.obs;
    switch (restModel.value.type) {
      case 'user':
        result.value =
            await repo.resetPassUser(restModel.value.id!, password.value);
        break;
      case 'comapny':
        result.value =
            await repo.resetPassComp(restModel.value.id!, password.value);
        break;
      case 'infulonser':
        result.value =
            await repo.resetPassInful(restModel.value.id!, password.value);
        break;
    }
    if (result.value) {
      await authService.logIn(email.value, password.value);
      if (!stroge.containsKey('type')) {
        return;
      }
      await QPanel(
              alignment: Alignment.bottomCenter,
              height: 120,
              child: Row(
                children:const [
                  Icon(
                    Icons.admin_panel_settings_sharp,
                    color: AppColors.orange,
                  ),
                  Text(
                    ' Saved New Password',
                    style: TextStyle(color: AppColors.blue),
                  ),
                ],
              ),
              duration:const Duration(seconds: 2))
          .show();
      Get.rootDelegate.offNamed(Routes.HOME);
    }
  }
}
