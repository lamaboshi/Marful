import 'package:get/get.dart';

import '../../../data/model/content.dart';
import '../../../data/repo/content_repo.dart';

class HomeMainController extends GetxController {
  final count = 0.obs;
  final contentRepo = ContenteRpository();
  final contents = <Content>[].obs;
  final loading = false.obs;
  @override
  void onInit() {
    getContent();
    super.onInit();
  }

  Future<void> getContent() async {
    loading.value = true;
    var res = await contentRepo.getContent();
    contents.assignAll(res);
    loading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
