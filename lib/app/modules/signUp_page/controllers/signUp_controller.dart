import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/signUp_page/data/model/company.dart';
import 'package:marful/app/modules/signUp_page/data/model/influencer.dart';
import 'package:marful/app/modules/signUp_page/data/model/user.dart';

class SignUpController extends GetxController {
  final isShownUser = false.obs;
  final isShownInfluencer = false.obs;
  final isShownCompany = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void regierterInflu(Influencer object) async {
    final _dio = Get.find<Dio>();
     final Response= await _dio.post('https://localhost:7192/api/Influncer',
        data: object.toJson());
  }

  Future<bool> regierterComp(Company object) async {
    final _dio = Get.find<Dio>();
   final Response= await _dio.post('https://localhost:7192/api/Company',
        data: object.toJson());
        if(Response.statusCode==200){
          return true;
        }
        else print(Response.statusMessage);
        return false;
  }

  void regierterUser(User object) async {
    final _dio = Get.find<Dio>();
    final Response=  await _dio.post('https://localhost:7192/api/User', data: object.toJson());
  }
}
