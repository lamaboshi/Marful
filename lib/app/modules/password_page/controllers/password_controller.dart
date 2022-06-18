import 'dart:html';

import 'package:get/get.dart';
import 'package:marful/app/data/model/infulonser.dart';

import '../data/adapter/password_adapter.dart';
import '../data/password_repository.dart';

class PasswordController extends GetxController {
  var allEmails=<Infulonser>[].obs;
  var infuloncer =Infulonser(id: 0, name: '', phone: 'phone', email:' email', paypal: 'paypal', address: 'address', password: 'password', userName: 'userName', image: null, description: 'description');
  final passRepo= PasswordRepository();
  final entrvalue=''.obs;
 final email=''.obs;
  final result=false.obs;
  
  @override
  void onInit() {
    super.onInit();
  getAllEmails();
  Result();
  }
    Future<void> Result() async {
   Infulonser i=allEmails.firstWhere((element) => element.email==email);
    if(i!=null){
      result.value=true;
    }
    
  }
  
    Future<void> getAllEmails() async {
    var data = await passRepo.getdata();
    allEmails.assignAll(data);
  }
   Future<void> Resetpassword(String email) async {
  infuloncer.email=email;
     passRepo. updatedata( infuloncer);
 
    //   await _auth
    //     .sendPasswordResetEmail(email: email)
    //     .then((value) => _status = AuthStatus.successful)
    //     .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
    // return _status;
  }


}