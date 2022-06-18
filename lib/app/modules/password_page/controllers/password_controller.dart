import 'dart:html';

import 'package:get/get.dart';
import 'package:marful/app/data/model/infulonser.dart';

import '../data/adapter/password_adapter.dart';
import '../data/password_repository.dart';

class PasswordController extends GetxController {
  var allEmails=<Infulonser>[].obs;
  final passRepo= PasswordRepository();
  final entrvalue=''.obs;
  final result=false.obs;
  @override
  void onInit() {
    super.onInit();
  getAllEmails();
  Result();
  }
    Future<void> Result() async {
    if(allEmails.contains(entrvalue)){
      result.value=true;
    }
    
  }
    Future<void> getAllEmails() async {
    var data = await passRepo.getdata();
    allEmails.assignAll(data);
  }

}