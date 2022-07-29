import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/content.dart';
import '../../../data/repo/content_repo.dart';
import '../data/homeMain_repo.dart';
import '../data/model/getPost.dart';

class HomeMainController extends GetxController {
  final contentRepo = ContenteRpository();
  final contents = <Content>[].obs;
  final auth = Get.find<AuthService>();
  final homeMainRepo = HomeMainRepositry();
  final post = <GetPost>[].obs;
  final loading = false.obs;
  final contentId = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getContent();
    getData();
  }

  Future<void> getData() async {
    await getAllPosts();
  }

  Future<void> getContent() async {
    var res = await contentRepo.getContent();
    contents.assignAll(res);
  }

  Future<void> getAllPosts() async {
    print('getAllPosts');
    loading.value = true;
    var res = await homeMainRepo.getAllPost(auth.personType(), getEmail());
    post.assignAll(res);
    loading.value = false;
  }

  Future<void> getPostsWithContent() async {
    post.clear();
    loading.value = true;
    var res = await homeMainRepo.getPostWithContent(
        contentId.value, auth.personType(), getEmail());
    post.assignAll(res);
    loading.value = false;
  }

  String getEmail() {
    switch (auth.getTypeEnum()) {
      case Auth.comapny:
        return (auth.getDataFromStorage() as Company).email!;
      case Auth.infulonser:
        return (auth.getDataFromStorage() as Infulonser).email!;
      case Auth.user:
        return (auth.getDataFromStorage() as UserModel).email!;
      default:
        return '';
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
