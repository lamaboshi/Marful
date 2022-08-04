import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/infulonsercontent.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';

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
  final companycontent=CompanyContent().obs;
  final infulonserContent=InfulonserContent().obs;
  final contents = <Content>[].obs;
  final allContents = <Content>[].obs;
<<<<<<< HEAD
  final allcontentnew=<Content>[].obs;
=======
>>>>>>> b7ce7c37fe646778cb97984ce972878ad8496866
  final imagefile = File('').obs;
  final posts = <Post>[].obs;
  //////////////////For Update
  final numberperson=0.obs;
  final info=Infulonser().obs;
  final comp=Company().obs;
  final use= UserModel().obs;
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

  Future<List<Content>> getContent() async {
    var res = await contentRepo.getContent();
    return res;
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
    var data = await getContent();
    allContents.assignAll(data);
  }
  /////////
<<<<<<< HEAD
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
        UpdateContentCompany(company.value.id!);
=======
  Future<void> UpdateDataforperson() async {
    switch (typeAuth.value) {
      case Auth.user:
        await Updateuser();
        break;
      case Auth.comapny:
        await Updatecompany();

>>>>>>> b7ce7c37fe646778cb97984ce972878ad8496866
        break;
      case Auth.infulonser:
        // TODO: Handle this case.
        break;
      case Auth.none:
        break;
    }
  }
  Future<void> getContentComapny(int id) async {
    print('getContentComapny');
    var data = await repo.GetCompanyConent(id);
    contents.assignAll(data);
  }

  Future<void> getContentInful(int id) async {
<<<<<<< HEAD
    print('getContentInful');
    print(id);
=======
>>>>>>> b7ce7c37fe646778cb97984ce972878ad8496866
    var data = await repo.GetInfulConent(id);
    contents.assignAll(data);
  }

  Future<void> getPostInful(int id) async {
    print('getPostInful');
    var data = await repo.GetInfulPost(id);
    posts.assignAll(data);
  }

  Future<void> getPostCompany(int id) async {
    print('getPostCompany');
    var data = await repo.GetCompPost(id);
    posts.assignAll(data);
  }
    Future<void> Updateinfolunser(int id) async {
    infulencer.value=info.value;
     await repo.Updateinfo(infulencer.value,infulencer.value.id!);
    
  }
<<<<<<< HEAD
    Future<void>  Updatecompany(int id) async {
    company.value=comp.value;
     await repo.Updatecomp(company.value,company.value.id!);
  }
      Future<void>  Updateuser(int id) async {
        user.value=use.value;
     await repo.Updateuse(user.value,user.value.id!);
  }
       Future<void>UpdateContentinfluonser (int id) async {
       var  allcontentnew=contents;
       getContent();
       for( var content in contents){
        for(var newcontent in allcontentnew){
          if(contents.length<allcontentnew.length){
           if(newcontent!=content){
            infulonserContent.value.InfulonserId=id;
            infulonserContent.value.content!.id=newcontent.id;
               await repo.AddcontentInfulonser(infulonserContent.value,newcontent.id!);
            
           }
          }
           else if(contents.length>allcontentnew.length) {
           if(content!=newcontent){
               infulonserContent.value.InfulonserId=id;
            infulonserContent.value.content!.id=content.id;
                 await repo.DeletcontentInfulonser(infulonserContent.value,content.id!);
           }
           }
        }
       }
  }
         Future<void>UpdateContentCompany (int id,) async {
       var  allcontentnew=contents;
       getContent();
       for( var content in contents){
        for(var newcontent in allcontentnew){
          if(contents.length<allcontentnew.length){
           if(newcontent!=content){
             companycontent.value.companyId=id;
             companycontent.value.content!.id=newcontent.id;
               await repo.AddcontentCompany(companycontent.value);
            
           }
          }
           else if(contents.length>allcontentnew.length) {
           if(content!=newcontent){
            companycontent.value.companyId=id;
            companycontent.value.content!.id=content.id;
                 await repo.DeletcontentCompany(companycontent.value,content.id!);
           }
           }
        }
       }
=======

  Future<void> Updatecompany() async {
    company.value = comp.value;
    await repo.Updatecomp(company.value, company.value.id!);
  }

  Future<void> Updateuser() async {
    user.value = use.value;
    await repo.Updateuse(user.value, user.value.id!);
  }

  Future<void> addcontentinfo(int id) async {
    await repo.AddcontentInfulonser(info.value.id!, id);
  }

  Future<void> addcontentcomp(int id) async {
    await repo.AddcontentCompany(company.value.id!, id);
  }

  Future<void> Deletcontentinfo(int id) async {
    await repo.DeletcontentInfulonser(id);
  }

  Future<void> Deletcontentcomp(int id) async {
    await repo.DeletcontentCompany(id);
  }

  Future<void> updateContent() async {
    var data = await getContent();
    for (var item in data) {
      if (!contents.contains(item)) {
        if (typeAuth.value == Auth.comapny) {
          Deletcontentcomp(item.id!);
        } else if (typeAuth.value == Auth.infulonser) {
          Deletcontentinfo(item.id!);
        }
      }
    }
    for (var item in contents) {
      if (!data.contains(item)) {
        if (typeAuth.value == Auth.comapny) {
          addcontentcomp(item.id!);
        } else if (typeAuth.value == Auth.infulonser) {
          addcontentinfo(item.id!);
        }
      }
    }
>>>>>>> b7ce7c37fe646778cb97984ce972878ad8496866
  }
}
