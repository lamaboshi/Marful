import 'package:get/get.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/brand.dart';
import '../../../data/model/company.dart';
import '../../../data/model/infulonser.dart';
import '../../../data/model/user_model.dart';
import '../data/brand.repostitry.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/content.dart';

class BrandPageController extends GetxController {
  final allBrands=<Brand>[].obs;
  final brand= Brand().obs;
  final braRepo=BrandRepository();
  @override
  void onInit() {
    super.onInit();
  }
    //  Future<void> Dataforperson() async {
    // switch (auth.personType()) {
    //   case 'user':
    //     typeAuth.value = Auth.user;
    //     user.value = auth.getDataFromStorage() as UserModel;
      
    //     break;
    //   case 'comapny':
    //     typeAuth.value = Auth.comapny;
    //     company.value = auth.getDataFromStorage() as Company;
      
        
    //     break;
    //   case 'infulonser':
    //     typeAuth.value = Auth.infulonser;
    //     infulencer.value = auth.getDataFromStorage() as Infulonser;
       
      
    //     break;
    // }
       Future<void> getAllBrand() async {
    var data = await braRepo.GetBrand();
    allBrands.assignAll(data);
  }
    Future<void> DelBrand(Content content) async {
   // await braRepo.DelBrand();
  }
  }
//}
