import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/content.dart';
import '../../../data/repo/content_repo.dart';
import '../data/profile_repository.dart';

class ProfileController extends GetxController {
  final kind = true.obs;
  final typeAuth = Auth.user.obs;
  final contentRepo = ContenteRpository();
  final repo = ProfailRepository();
  final auth = Get.find<AuthService>();
  final infulencer = Infulonser().obs;
  final company = Company().obs;
  final user = UserModel().obs;
  final contents = <Content>[].obs;
  final allContents = <Content>[].obs;
  final allcontentnew = <Content>[].obs;
  final imagefile = File('').obs;
  final posts = <Post>[].obs;
  //////////////////For Update
  final numberperson = 0.obs;
  final info = Infulonser().obs;
  final comp = Company().obs;
  final use = UserModel().obs;
  @override
  void onInit() {
    super.onInit();
    getDataperson();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      imagefile.value = imageTemp;
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> getContent() async {
    var res = await contentRepo.getContent();
    allContents.assignAll(res);
  }

  Future<void> getDataperson() async {
    switch (auth.personType()) {
      case 'user':
        typeAuth.value = Auth.user;
        user.value = auth.getDataFromStorage() as UserModel;
        break;
      case 'comapny':
        typeAuth.value = Auth.comapny;
        company.value = auth.getDataFromStorage() as Company;
        await getContentComapny(company.value.id!);
        await getPostCompany(company.value.id!);
        break;
      case 'infulonser':
        typeAuth.value = Auth.infulonser;
        infulencer.value = auth.getDataFromStorage() as Infulonser;
        await getContentInful(infulencer.value.id!);
        await getPostInful(infulencer.value.id!);
        break;
    }
    await getContent();
  }

  /////////
  Future<void> UpdateDataforperson() async {
    switch (auth.personType()) {
      case 'user':
        typeAuth.value = Auth.user;
        user.value = auth.getDataFromStorage() as UserModel;
        Updateuser(user.value.id!);
        break;
      case 'comapny':
        typeAuth.value = Auth.comapny;
        company.value = auth.getDataFromStorage() as Company;
        Updatecompany(company.value.id!);
        break;
      case 'infulonser':
        typeAuth.value = Auth.infulonser;
        infulencer.value = auth.getDataFromStorage() as Infulonser;
        Updateinfolunser(infulencer.value.id!);
        break;
    }
  }

  Future<void> getContentComapny(int id) async {
    var data = await repo.GetCompanyConent(id);
    contents.assignAll(data);
  }

  Future<void> getContentInful(int id) async {
    print(id);
    var data = await repo.GetInfulConent(id);
    contents.assignAll(data);
  }

  Future<void> getPostInful(int id) async {
    var data = await repo.GetInfulPost(id);
    posts.assignAll(data);
  }

  Future<void> getPostCompany(int id) async {
    var data = await repo.GetCompPost(id);
    posts.assignAll(data);
  }

  Future<void> Updateinfolunser(int id) async {
    infulencer.value = info.value;
    await repo.Updateinfo(infulencer.value, infulencer.value.id!);
  }

  Future<void> Updatecompany(int id) async {
    company.value = comp.value;
    await repo.Updatecomp(company.value, company.value.id!);
  }

  Future<void> Updateuser(int id) async {
    user.value = use.value;
    await repo.Updateuse(user.value, user.value.id!);
  }
}
