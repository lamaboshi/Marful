import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/signUp_page/data/influencer_repo.dart';
import 'package:marful/app/modules/signUp_page/data/user_repo.dart';
import 'package:marful/sheard/util.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/company.dart';
import '../../../routes/app_pages.dart';
import '../data/company_repo.dart';

class SignUpController extends GetxController {
  String? forceValue(dynamic value) {
    if (value == null) {
      return 'requird';
    }
    if (value is String && value.isEmpty) {
      return 'requird';
    }
    return null;
  }

  Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  final userForm = GlobalKey<FormState>();
  final influencerForm = GlobalKey<FormState>();
  final companyForm = GlobalKey<FormState>();
  final isShownUser = false.obs;
  final isShownInfluencer = false.obs;
  final isShownCompany = false.obs;
  final isSaveData = false.obs;
  final stringPickImage = ''.obs;
  final company = Company(
    id: 0,
    address: 'United Arab Emirates.',
    description: 'some description',
    email: 'comedy@test.com',
    name: 'comedy',
    telePhone: '68465458564',
    password: '5678',
    phone: '156518686',
  ).obs;
  final user = UserModel(
    id: 0,
    age: 22,
    email: 'userModel@test.com',
    name: 'UserTest',
    password: '1234',
    paypal: 'CodeThis',
    phone: '09468468',
    userName: 'User13',
  ).obs;
  final influencer = Infulonser(
    id: 0,
    name: 'barhom Marawe',
    address: 'United Arab Emirates.',
    description:
        'YouTube star popular for his comedy videos about social media drama posted to his Barhom m3arawi account. His videos average 10 minutes in length and often surpass 1 million views. The channel itself has over 2.5 million subscribers. ',
    email: 'Barhom@test.com',
    password: '0000',
    paypal: 'ThisCode',
    phone: '0944648565',
    userName: 'Barhom Mar',
  ).obs;

  final companyRpo = CompanyRepository();
  final influencerRpo = InfluencerRepository();
  final userRpo = UserRepository();

  final auth = Get.find<AuthService>();

  Future<void> signUpCompany() async {
    company.value.image = Utility.dataFromBase64String(stringPickImage.value);
    var data = await companyRpo.regierterComp(company.value);
    if (data) {
      await auth.logIn(company.value.email!, company.value.password!);
      Get.rootDelegate.toNamed(Routes.HOME);
    }
  }

  Future<void> signUpInfluencer() async {
    influencer.value.image =
        Utility.dataFromBase64String(stringPickImage.value);
    var data = await influencerRpo.regierterInfluencer(influencer.value);
    if (data) {
      await auth.logIn(influencer.value.email!, influencer.value.password!);
      Get.rootDelegate.toNamed(Routes.HOME);
    }
  }

  Future<void> signUpUser() async {
    user.value.image = Utility.dataFromBase64String(stringPickImage.value);
    var data = await userRpo.regierterUser(user.value);
    if (data) {
      await auth.logIn(user.value.email!, user.value.password!);
      Get.rootDelegate.toNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
}
