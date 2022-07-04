import 'package:get/get.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/signUp_page/data/influencer_repo.dart';
import 'package:marful/app/modules/signUp_page/data/user_repo.dart';
import '../../../../sheard/auth_service.dart';
import '../../../data/model/company.dart';
import '../../../routes/app_pages.dart';
import '../data/company_repo.dart';

class SignUpController extends GetxController {
  final isShownUser = true.obs;
  final isShownInfluencer = true.obs;
  final isShownCompany = true.obs;
  final company = Company().obs;
  final user = UserModel().obs;
  final influencer = Infulonser().obs;

  final companyRpo = CompanyRepository();
  final influencerRpo = InfluencerRepository();
  final userRpo = UserRepository();

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

  Future<void> signUpInfluencer() async {
    var data = await influencerRpo.regierterInfluencer(influencer.value);
    if (data) {
      auth.logIn(influencer.value.email!, influencer.value.password!);
      Get.rootDelegate.offNamed(Routes.HOME);
    }
  }

  Future<void> signUpUser() async {
    var data = await userRpo.regierterUser(user.value);
    if (data) {
      auth.logIn(user.value.email!, user.value.password!);
      Get.rootDelegate.offNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
}
