import 'package:get/get.dart';
import 'package:marful/app/modules/password_page/bindings/password_binding.dart';
import 'package:marful/app/modules/password_page/views/confirm_password.dart';
import 'package:marful/app/modules/password_page/views/password_page.dart';
import 'package:marful/app/modules/settings/bindings/setting_binding.dart';
import 'package:marful/app/modules/settings/views/setting_view.dart';
import 'package:marful/app/modules/websit_company/bindings/websit_company_binding.dart';
import 'package:marful/app/modules/websit_company/views/websit_company_page.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const iNITIAL = Routes.websitecompany;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ConfirmPassword,
      page: () => const Confirmpassword(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: _Paths.Password,
      page: () => PasswordPage(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: _Paths.websitecompany,
      page: () => WebsiteCompanyPage(),
      binding: WebsitcompanyBinding(),
    ),
    GetPage(
      name: _Paths.setting,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
  ];
}
