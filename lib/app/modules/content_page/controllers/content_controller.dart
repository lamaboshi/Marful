import 'package:get/get.dart';
import 'package:marful/app/data/model/content.dart';

import '../data/content_repostiry.dart';

class ContentController extends GetxController {
  final contents = <Content>[].obs;
  final addcontent = Content().obs;
  final contRepo = ContentRepository();
  @override
  void onInit() {
    super.onInit();
    getAllContent();
  }

  Future<void> getAllContent() async {
    var data = await contRepo.GetContent();
    contents.assignAll(data);
  }

  Future<void> delcontentelement(Content content) async {
    var res = await contRepo.DelContent(content.id!);
    if (res) {
      getAllContent();
    }
  }

  Future<void> addcontentelement(Content content) async {
    var res = await contRepo.AddContent(content);
    if (res) {
      getAllContent();
      Get.back();
    }
  }
}
