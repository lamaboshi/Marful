import 'package:get/get.dart';
import 'package:marful/app/modules/firstsplash_page/bindings/firstSplash_binding.dart';
import 'package:marful/app/modules/firstsplash_page/views/firstSplash_view.dart';
import 'package:marful/app/modules/intro_page/bindings/intro_binding.dart';
import 'package:marful/app/modules/intro_page/view/intro_view.dart';
import 'package:marful/app/modules/password_page/bindings/password_binding.dart';
import 'package:marful/app/modules/password_page/views/confirm_password.dart';
import 'package:marful/app/modules/password_page/views/password_page.dart';
import 'package:marful/app/modules/signIn_page/bindings/signIn_binding.dart';
import 'package:marful/app/modules/signIn_page/view/signIn_view.dart';
import 'package:marful/app/modules/signUp_page/bindings/signUp_binding.dart';
import 'package:marful/app/modules/signUp_page/view/signUpComp_view.dart';
import 'package:marful/app/modules/signUp_page/view/signUpInf_view.dart';
import 'package:marful/app/modules/signUp_page/view/signUpUser_view.dart';
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
     GetPage(
      name: _Paths.Intro,
      page: () =>IntroPage(),
      binding:IntroBinding(),
    ),
     GetPage(
      name: _Paths.SignUpUserPage,
      page: () => SignUpUserPage(),
      binding:SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SignIn,
      page: () => SignInPage(),
      binding:SignInBinding(),
    ),
   GetPage(
      name: _Paths.FirstSplash,
      page: () => FiestSplashPage(),
      binding: FirstSplashBinding(),
    ),
    GetPage(
      name: _Paths.SignUpInfluencer,
      page: () => SignUpInfluencer(),
      binding:SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SignUpCompany,
      page: () => SignUpCompanyPage(),
      binding:SignUpBinding(),
    ),
  ];
}
