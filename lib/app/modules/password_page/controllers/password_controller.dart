import 'dart:html';

import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';

import '../../../../sheard/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../data/adapter/password_adapter.dart';
import '../data/password_repository.dart';
class PasswordController extends GetxController {
  var allEmails=<Infulonser>[].obs;
  final Repo= PasswordRepository();
  final resrtpassword=''.obs;
 final email=''.obs;
  final auth=Get.find<AuthService >();
    final typeAuth=Auth.user.obs;
  //final result=false.obs;
  final company=Company().obs;
  final user=UserModel().obs;
  final  infulencer=Infulonser().obs;
final type=''.obs;
  
  @override
  void onInit() {
    super.onInit();
  }
  void getEmail(){
  var data=Repo.getEmail(email.value);
  if(data!=null){
  type.value=data as String;
  Get.rootDelegate.offNamed(Routes.ConfirmPassword);
  }
   void resetPassword(){
          switch (type.value
           // auth.personType()
            ) {
        case 'user':
          typeAuth.value=Auth.user;
          user.value=auth.getDataFromStorage() as UserModel;
          user.value.password=resrtpassword.value;
          Repo.resetPassUser(user.value);
          break;
        case 'comapny':
              typeAuth.value=Auth.comapny;
          company.value=auth.getDataFromStorage() as Company;
            company.value.password=resrtpassword.value;
           // Repo.resetPassComp(company.value);
          break;
        case 'infulonser':
             typeAuth.value=Auth.infulonser;
          infulencer.value=auth.getDataFromStorage() as Infulonser;
          infulencer.value.password=resrtpassword.value;
          Repo.resetPassInful(infulencer.value);
          break;
      }
   }
  }  
  }

