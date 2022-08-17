import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/infulonsercontent.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/profile/data/user_infu.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';
import 'package:marful/sheard/util.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/content.dart';
import '../../../data/repo/content_repo.dart';
import '../data/Infu_follow.dart';
import '../data/company_ifu.dart';
import '../data/company_user.dart';
import '../data/model_data.dart';
import '../data/profile_repository.dart';

class ProfileController extends GetxController {
  final kind = true.obs;
  final _dio = Get.find<Dio>();
  final typeAuth = Auth.user.obs;
  final contentRepo = ContenteRpository();
  final repo = ProfailRepository();
  final auth = Get.find<AuthService>();
  final infulencer = Infulonser().obs;
  final company = Company().obs;
  final user = UserModel().obs;
  final companycontent = CompanyContent().obs;
  final infulonserContent = InfulonserContent().obs;
  final contents = <Content>[].obs;
  final allContents = <Content>[].obs;
  final stringPickImage = ''.obs;
  final posts = <Post>[].obs;
  final follower = <ModelData>[].obs;
  //////////////////For Update
  final numberperson = 0.obs;
  final followerCount = 0.obs;
  final info = Infulonser().obs;
  final comp = Company().obs;
  final use = UserModel().obs;
  final loading = false.obs;
  final infoSearch = Infulonser().obs;
  final companySearch = Company().obs;
  final userCompany = UserCompany().obs;
  final infuUser = InfulonserUser().obs;
  final infoFinfo = InfulonserFollowInfulonser().obs;
  final companyInfu = CompanyInfulonser().obs;
  final hasFollowed = false.obs;
  @override
  void onInit() {
    super.onInit();
    getDataperson();
  }

  Future<void> getFollowed(Auth type, int id) async {
    hasFollowed.value = false;
    if (auth.getTypeEnum() == type && type == Auth.infulonser) {
      infoFinfo.value = await repo
          .getInfuFollowedInfu((auth.getDataFromStorage() as Infulonser).id!);
      hasFollowed.value = infoFinfo.value.followedId == id;
    } else if (auth.getTypeEnum() == Auth.user && type == Auth.comapny) {
      userCompany.value = await repo
          .getuserCompany((auth.getDataFromStorage() as UserModel).id!);
      hasFollowed.value = follower.any((element) =>
          element.email == (auth.getDataFromStorage() as UserModel).email!);
    } else if (auth.getTypeEnum() == Auth.user && type == Auth.infulonser) {
      infuUser.value =
          await repo.getuserInfo((auth.getDataFromStorage() as UserModel).id!);
      hasFollowed.value = follower.any((element) =>
          element.email == (auth.getDataFromStorage() as UserModel).email!);
    } else if (auth.getTypeEnum() == Auth.comapny && type == Auth.infulonser) {
      companyInfu.value = await repo.getCompanyInfulonser(
          (auth.getDataFromStorage() as Company).id!, 0);
      hasFollowed.value = companyInfu.value.infulonserId == id;
    } else if (auth.getTypeEnum() == Auth.infulonser && type == Auth.comapny) {
      companyInfu.value = await repo.getCompanyInfulonser(
          0, (auth.getDataFromStorage() as Infulonser).id!);
      hasFollowed.value = companyInfu.value.companyId == id;
    }
  }

  Future<void> addFollow(Auth type) async {
    if (auth.getTypeEnum() == type && type == Auth.infulonser) {
      var infuFol = InfulonserFollowInfulonser(
          followId: infoSearch.value.id!,
          followedId: (auth.getDataFromStorage() as Infulonser).id!);
      hasFollowed.value = await repo.addInfuFollowedInfu(infuFol);
    } else if (auth.getTypeEnum() == Auth.user && type == Auth.comapny) {
      var data = UserCompany(
          companyId: companySearch.value.id!,
          userId: (auth.getDataFromStorage() as UserModel).id!);
      hasFollowed.value = await repo.adduserCompany(data);
      getcompanyType(companySearch.value.id!);
    } else if (auth.getTypeEnum() == Auth.user && type == Auth.infulonser) {
      var data = InfulonserUser(
          infulonserId: infoSearch.value.id!,
          userId: (auth.getDataFromStorage() as UserModel).id!);
      hasFollowed.value = await repo.adduserInfo(data);
      getInfoType(infoSearch.value.id!);
    } else if (auth.getTypeEnum() == Auth.comapny && type == Auth.infulonser) {
      var data = CompanyInfulonser(
          infulonserId: infoSearch.value.id!,
          followed: 'company',
          companyId: (auth.getDataFromStorage() as Company).id!);
      hasFollowed.value = await repo.addCompanyInfulonser(data);
    } else if (auth.getTypeEnum() == Auth.infulonser && type == Auth.comapny) {
      var data = CompanyInfulonser(
          infulonserId: infoSearch.value.id!,
          followed: 'infulonser',
          companyId: (auth.getDataFromStorage() as Company).id!);
      hasFollowed.value = await repo.addCompanyInfulonser(data);
    }
    //  getFollowed(type);
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> getInfoType(int id) async {
    infoSearch.value = Infulonser();
    companySearch.value = Company();
    loading.value = true;
    var result =
        await _dio.get('https://localhost:7192/api/Infulonser/Get/$id');
    infoSearch.value = Infulonser.fromJson(result.data as Map<String, dynamic>);
    await getContentInful(infoSearch.value.id!);
    await getPostInful(infoSearch.value.id!);
    await getfllowerInful(infoSearch.value.email!);
    await getfllowerInfulCount(infoSearch.value.email!);
    await getFollowed(typeAuth.value, id);
    loading.value = false;
  }

  Future<void> getcompanyType(int id) async {
    hasFollowed.value = false;
    infoSearch.value = Infulonser();
    companySearch.value = Company();
    loading.value = true;
    var result =
        await _dio.get('https://localhost:7192/api/Company/GetCompany/$id');
    companySearch.value = Company.fromJson(result.data as Map<String, dynamic>);
    await getContentComapny(companySearch.value.id!);
    await getPostCompany(companySearch.value.id!);
    await getfllowerCompany(companySearch.value.email!);
    await getfllowerCompanyCount(companySearch.value.email!);
    await getFollowed(typeAuth.value, id);
    loading.value = false;
  }

  Future<List<Content>> getContent() async {
    var res = await contentRepo.getContent();
    return res;
  }

  Future<void> getDataperson() async {
    loading.value = true;
    var data = await getContent();
    allContents.assignAll(data);
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
        await getfllowerCompany((auth.getDataFromStorage() as Company).email!);
        await getfllowerCompanyCount(
            (auth.getDataFromStorage() as Company).email!);

        break;
      case 'infulonser':
        typeAuth.value = Auth.infulonser;
        infulencer.value = auth.getDataFromStorage() as Infulonser;
        await getContentInful(infulencer.value.id!);
        await getPostInful(infulencer.value.id!);
        await getfllowerInful((auth.getDataFromStorage() as Infulonser).email!);
        await getfllowerInfulCount(
            (auth.getDataFromStorage() as Infulonser).email!);
        break;
    }
    loading.value = false;
  }

  Future<void> UpdateDataforperson() async {
    switch (typeAuth.value) {
      case Auth.user:
        await Updateuser();
        break;
      case Auth.comapny:
        await Updatecompany();
        break;
      case Auth.infulonser:
        await Updateinfolunser();
        break;
      case Auth.none:
        break;
    }

  }

  Future<void> deletePost(int id) async {
    var data = await repo.DeletPost(id);
    if (data) {
      QOverlay.dismissLast();
      posts.removeWhere((element) => element.id == id);
    }
  }

  Future<void> updatePost(int id, Post post) async {
    post.image = Utility.dataFromBase64String(stringPickImage.value);
    var data = await repo.UpdatePost(id, post);
    if (data) {
      QOverlay.dismissLast();
      stringPickImage.value = '';
      auth.getTypeEnum() == Auth.infulonser
          ? await getPostInful(infulencer.value.id!)
          : await getPostCompany(company.value.id!);
    }
  }

  Future<void> getContentComapny(int id) async {
    contents.clear();
    var data = await repo.getCompanyConent(id);
    for (var item in data) {
      contents.add(item.content!);
    }
  }

  Future<void> getContentInful(int id) async {
    contents.clear();
    var data = await repo.GetInfulConent(id);
    contents.assignAll(data);
  }

  Future<void> getfllowerInful(String email) async {
    var data = await repo.getAllFollowInfu(email);
    follower.assignAll(data);
  }

  Future<void> getfllowerInfulCount(String email) async {
    var data = await repo.getCountFollowInfu(email);
    followerCount.value = data;
  }

  Future<void> getfllowerCompany(String email) async {
    var data = await repo.getAllFollowCompany(email);
    follower.assignAll(data);
  }

  Future<void> getfllowerCompanyCount(String email) async {
    var data = await repo.getCountFollowCompany(email);
    followerCount.value = data;
  }

  Future<void> getPostInful(int id) async {
    posts.clear();
    print('getPostInful');
    var data = await repo.GetInfulPost(id);
    posts.assignAll(data);
  }

  Future<void> getPostCompany(int id) async {
    print('getPostCompany');
    var data = await repo.GetCompPost(id);
    posts.assignAll(data);
  }

  Future<void> Updateinfolunser() async {
    info.value.image = Utility.dataFromBase64String(stringPickImage.value);
    await repo.Updateinfo(info.value, infulencer.value.id!);
    auth.stroge.deleteAllKeys();
    auth.logIn(infulencer.value.email!, infulencer.value.password!);
  }

  Future<void> Updatecompany() async {
    comp.value.image = Utility.dataFromBase64String(stringPickImage.value);
    await repo.Updatecomp(comp.value, company.value.id!);
    auth.stroge.deleteAllKeys();
    auth.logIn(company.value.email!, company.value.password!);
  }

  Future<void> Updateuser() async {
    user.value = use.value;
    user.value.image = Utility.dataFromBase64String(stringPickImage.value);
    await repo.Updateuse(user.value, user.value.id!);
        auth.stroge.deleteAllKeys();
    auth.logIn(user.value.email!, user.value.password!);
  }

  Future<void> addcontentinfo(int id) async {
    var data = await repo.AddcontentInfulonser(info.value.id!, id);
    if (data) {
      await getContentInful(infulencer.value.id!);
    }
  }

  Future<void> addcontentcomp(int id) async {
    var data = await repo.AddcontentCompany(company.value.id!, id);
    if (data) {
      await getContentComapny(company.value.id!);
    }
  }

  Future<void> Deletcontentinfo(int id) async {
    var data = await repo.DeletcontentInfulonser(id, infulencer.value.id!);
    if (data) {
      await getContentInful(infulencer.value.id!);
      QOverlay.dismissLast();
    }
  }

  Future<void> Deletcontentcomp(int id) async {
    var data = await repo.DeletcontentCompany(id, company.value.id!);
    if (data) {
      await getContentComapny(company.value.id!);
      QOverlay.dismissLast();
    }
  }
}
