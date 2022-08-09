import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/infulonsercontent.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/homeMain_page/data/model/Post.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';
import 'package:marful/sheard/util.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/content.dart';
import '../../../data/repo/content_repo.dart';
import '../data/model_data.dart';
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
  @override
  void onInit() {
    super.onInit();
    getDataperson();
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

  Future<List<Content>> getContent() async {
    var res = await contentRepo.getContent();
    return res;
  }

  Future<void> getDataperson() async {
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
        await getfllowerCompany();
        await getfllowerCompanyCount();

        break;
      case 'infulonser':
        typeAuth.value = Auth.infulonser;
        infulencer.value = auth.getDataFromStorage() as Infulonser;
        await getContentInful(infulencer.value.id!);
        await getPostInful(infulencer.value.id!);
        await getfllowerInful();
        await getfllowerInfulCount();
        break;
    }
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

  Future<void> getfllowerInful() async {
    var data = await repo
        .getAllFollowInfu((auth.getDataFromStorage() as Infulonser).email!);
    follower.assignAll(data);
  }

  Future<void> getfllowerInfulCount() async {
    var data = await repo
        .getCountFollowInfu((auth.getDataFromStorage() as Infulonser).email!);
    followerCount.value = data;
  }

  Future<void> getfllowerCompany() async {
    var data = await repo
        .getAllFollowCompany((auth.getDataFromStorage() as Company).email!);
    follower.assignAll(data);
  }

  Future<void> getfllowerCompanyCount() async {
    var data = await repo
        .getCountFollowCompany((auth.getDataFromStorage() as Company).email!);
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
