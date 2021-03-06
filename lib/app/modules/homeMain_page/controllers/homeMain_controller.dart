import 'package:get/get.dart';

import '../../../data/model/content.dart';
import '../../../data/repo/content_repo.dart';
import '../data/homeMain_repo.dart';
import '../data/model/getPost.dart';

class HomeMainController extends GetxController {
  final contentRepo = ContenteRpository();
  final contents = <Content>[].obs;
  final homeMainRepo = HomeMainRepositry();
  final post = <GetPost>[].obs;
  final postWithContent = <GetPost>[].obs;
  final loading = false.obs;
  final contentId = 0.obs;
  List<String> brand = [
    'huda beuty',
    'narins',
    'karen wazen',
    'huda beuty',
    'narins',
    'karen wazen'
  ];
  final selectedBrand = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
    print('hhoiiiiii');
    print('hhoiiiiii');
    print(post.value);
  }

  Future<void> getData() async {
    await getContent();
    await getAllPosts();
  }

  Future<void> getContent() async {
    loading.value = true;
    var res = await contentRepo.getContent();
    contents.assignAll(res);
    loading.value = false;
    res.map((e) => print(e));
  }

  Future<void> getAllPosts() async {
    loading.value = true;
    var res = await homeMainRepo.getAllPost();
    post.assignAll(res);
    loading.value = false;
  }

  Future<void> getPostsWithContent() async {
    loading.value = true;
    var res = await homeMainRepo.getPostWithContent(contentId.value);
    postWithContent.assignAll(res);
    loading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
