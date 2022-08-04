import 'package:get/get.dart';
import 'package:marful/app/data/model/content.dart';

class ContentController extends GetxController {
  final contents=<Content>[].obs;
  final addcontent= Content().obs;
  final contRepo=ContentRepository();
  // final type = [
  //   'comidy',
  //   'fashon',
  //   'hfgbv',
  //   'hfgh',
  //   'comidy',
  //   'fashon',
  //   'hfgbv',
  //   'hfgh',
  //   'comidy',
  //   'fashon',
  //   'hfgbv',
  //   'hfgh',
  //   'comidy',
  //   'fashon',
  //   'hfgbv',
  //   'hfgh',
  // ].obs;

  @override
  void onInit() {
    super.onInit();
    getAllContent();
  }
    Future<void> getAllContent() async {
    var data = await contRepo.getdata();
    contents.assignAll(data);
  }
    Future<void> delcontentelement(Content content) async {
    await contRepo.DelContent();
  }
    Future<void> addcontentelement(Content content) async {
    await contRepo.DelContent();
  }
}
