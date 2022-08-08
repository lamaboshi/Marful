import 'package:get/get.dart';

import '../../sheard/auth_service.dart';
import '../modules/addEmployee_page/bindings/add_employee_page_binding.dart';
import '../modules/addEmployee_page/views/add_employee_page_view.dart';
import '../modules/brand_page/bindings/brand_page_binding.dart';
import '../modules/brand_page/views/brand_page_view.dart';
import '../modules/chat_page/bindings/chat_page_binding.dart';
import '../modules/chat_page/views/chat_page_view.dart';
import '../modules/content_page/bindings/content_binding.dart';
import '../modules/content_page/views/content_view.dart';
import '../modules/conversation_page/bindings/conversation_page_binding.dart';
import '../modules/conversation_page/views/conversation_page_view.dart';
import '../modules/employeePer_page/bindings/employee_per_page_binding.dart';
import '../modules/employeePer_page/views/employee_per_page_view.dart';
import '../modules/firstsplash_page/bindings/firstSplash_binding.dart';
import '../modules/firstsplash_page/views/firstSplash_view.dart';
import '../modules/haya/bindings/haya_binding.dart';
import '../modules/haya/views/haya_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeMain_page/bindings/homeMain_binding.dart';
import '../modules/homePost_page/bindings/homePost_binding.dart';
import '../modules/homePost_page/views/homePost_view.dart';
import '../modules/menu/bindings/menu_binding.dart';
import '../modules/menu/views/menu_view.dart';
import '../modules/password_page/bindings/password_binding.dart';
import '../modules/password_page/views/confirm_password.dart';
import '../modules/password_page/views/password_page.dart';
import '../modules/permission_page/bindings/permission_page_binding.dart';
import '../modules/permission_page/views/permission_page_view.dart';
import '../modules/product_page/bindings/product_page_binding.dart';
import '../modules/product_page/views/product_page_view.dart';
import '../modules/profile/binding/profile_binding.dart';
import '../modules/profile/views/edit_profile.dart';
import '../modules/report_page/bindings/report_binding.dart';
import '../modules/report_page/views/report_view.dart';
import '../modules/search_page/bindings/search_binding.dart';
import '../modules/search_page/views/search_view.dart';
import '../modules/setting_page/bindings/setting_page_binding.dart';
import '../modules/setting_page/views/setting_page_view.dart';
import '../modules/settings/bindings/setting_binding.dart';
import '../modules/settings/views/setting_view.dart';
import '../modules/signIn_page/bindings/signIn_binding.dart';
import '../modules/signIn_page/view/signIn_view.dart';
import '../modules/signUp_page/bindings/signUp_binding.dart';
import '../modules/signUp_page/view/signUpComp_view.dart';
import '../modules/signUp_page/view/signUpInf_view.dart';
import '../modules/signUp_page/view/signUpUser_view.dart';
import '../modules/websit_company/bindings/websit_company_binding.dart';
import '../modules/websit_company/views/websit_company_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  //static const iNITIAL = Routes.websitecompany;

  static final routes = [
    GetPage(
      name: _Paths.SignIn,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.FirstSplash,
      page: () => FiestSplashView(),
      binding: FirstSplashBinding(),
    ),
    GetPage(
      name: _Paths.HAYA,
      page: () => const HayaView(),
      bindings: [HayaBinding(), MenuBinding(), HomePostBinding()],
    ),
    GetPage(
      name: _Paths.Content,
      page: () => ContentView(),
      binding: ContentBinding(),
    ),
    GetPage(name: _Paths.HOME, page: () => HomeView(), bindings: [
      HomeBinding(),
      HomeMainBinding(),
      HomePostBinding(),
      MenuBinding(),
      ProfileBinding()
    ], middlewares: [
      AuthMiddlware()
    ], children: [
      GetPage(
        name: _Paths.EditProfile,
        page: () => EditProfilePage(),
      ),
    ]),

    GetPage(
      name: _Paths.HOMEPOST,
      page: () => const HomePostView(),
      binding: HomePostBinding(),
    ),

    GetPage(
      name: _Paths.HOMEPOST,
      page: () => const HomePostView(),
      binding: HomePostBinding(),
    ),
    GetPage(
      name: _Paths.WebsiteCompany,
      page: () => WebsiteCompanyPage(),
      binding: WebsitcompanyBinding(),
    ),

    GetPage(
        name: _Paths.Password,
        page: () => PasswordPageView(),
        binding: PasswordBinding(),
        children: [
          GetPage(
            name: _Paths.ConfirmPassword,
            page: () => const Confirmpassword(),
          ),
        ]),
    GetPage(
      name: _Paths.Setting,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),

    GetPage(
      name: _Paths.SignUpUserPage,
      page: () => SignUpUserPage(),
      binding: SignUpBinding(),
    ),

    GetPage(
      name: _Paths.SignUpInfluencer,
      page: () => SignUpInfluencer(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SignUpCompany,
      page: () => SignUpCompanyPage(),
      binding: SignUpBinding(),
    ),
    // GetPage(
    //   name: _Paths.menu,
    //   page: () => ProfilePage(),
    //   binding: ProfileBinding(),
    // ),

    GetPage(
        name: _Paths.Menu,
        page: () => const HomeMenuView(),
        bindings: [MenuBinding(), SettingBinding(), ContentBinding()]),
    GetPage(
      name: _Paths.Report,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.Search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_PAGE,
      page: () => ChatPageView(),
      binding: ChatPageBinding(),
    ),
    GetPage(
      name: _Paths.CONVERSATION_PAGE,
      page: () => ConversationPageView(),
      binding: ConversationPageBinding(),
    ),

    GetPage(
      name: _Paths.SETTING_PAGE,
      page: () => const SettingPageView(),
      binding: SettingPageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_PAGE,
      page: () => const ProductPageView(),
      binding: ProductPageBinding(),
    ),
    GetPage(
      name: _Paths.PERMISSION_PAGE,
      page: () => const PermissionPageView(),
      binding: PermissionPageBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_PER_PAGE,
      page: () => const EmployeePerPageView(),
      binding: EmployeePerPageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EMPLOYEE_PAGE,
      page: () => const AddEmployeePageView(),
      binding: AddEmployeePageBinding(),
    ),
  ];
}
