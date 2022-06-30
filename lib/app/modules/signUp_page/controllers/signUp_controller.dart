import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../sheard/auth_service.dart';
import '../../../data/model/company.dart';
import '../../../routes/app_pages.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/data/model/infulonser.dart';
import '../data/company_repo.dart';

class SignUpController extends GetxController {
  final isShownUser = false.obs;
  final isShownInfluencer = false.obs;
  final isShownCompany = false.obs;
  final company = Company().obs;
  final companyRpo = CompanyRepository();
  final auth = Get.find<AuthService>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> signUpCompany() async {
    var data = await companyRpo.regierterComp(company.value);
    if (data) {
      auth.logIn(company.value.email!, company.value.password!);
      Get.rootDelegate.offNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
  void regierterInflu( Infulonser object) async {
    final _dio = Get.find<Dio>();
    final Response = await _dio.post('https://localhost:7192/api/Influncer',
        data: object.toJson());
  }

  void regierterUser(UserModel object) async {
    final _dio = Get.find<Dio>();
    final Response = await _dio.post('https://localhost:7192/api/User',
        data: object.toJson());
  }
}
