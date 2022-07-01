import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/content.dart';
import '../data/profile_repository.dart';

class ProfileController extends GetxController {
  final kind = true.obs;
  final typeAuth=Auth.user.obs;
  final repo=ProfailRepository();
 final auth=Get.find<AuthService >();
 final infulencer=Infulonser().obs;
final company=Company().obs;
final user=UserModel().obs;
final contents=<Content>[].obs;
 @override
  void onInit() {
    super.onInit();
   getDataperson();
  }
  void getDataperson(){
          switch (auth.personType()) {
        case 'user':
          typeAuth.value=Auth.user;
          user.value=auth.getDataFromStorage() as UserModel;
          break;
        case 'comapny':
              typeAuth.value=Auth.comapny;
          company.value=auth.getDataFromStorage() as Company;
          getContentComapny(company.value.id!);
          break;
        case 'infulonser':
             typeAuth.value=Auth.infulonser;
          infulencer.value=auth.getDataFromStorage() as Infulonser;
          getContentInful(infulencer.value.id!);
          break;
      }

  }
Future<void> getContentComapny(int id) async {
var data=await repo.GetCompanyConent(id);
contents.assignAll(data);
}
Future<void> getContentInful(int id) async {
var data=await repo.GetInfulConent(id);
contents.assignAll(data);
}
}
