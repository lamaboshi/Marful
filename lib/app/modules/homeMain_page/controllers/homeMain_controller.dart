import 'package:get/get.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/content.dart';
import '../../../data/repo/content_repo.dart';
import '../data/homeMain_repo.dart';
import '../data/model/Post.dart';
import '../data/model/getPost.dart';

class HomeMainController extends GetxController {
  final contentRepo = ContenteRpository();
  final contents = <Content>[].obs;
  final auth = Get.find<AuthService>();
  final homeMainRepo = HomeMainRepositry();
  final post = <GetPost>[].obs;
  final companyContent = <Content>[].obs;
  final newPost = Post().obs;
  final loading = false.obs;
  final contentId = 0.obs;
  final brand = <Brand>[].obs;
  final selectedBrand = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getContent();
    getData();
  }

  Future<void> getContentComapny() async {
    if (auth.getTypeEnum() == Auth.comapny) {
      var id = (auth.getDataFromStorage() as Company).id!;
      var data = await homeMainRepo.getCompanyConent(id);
      companyContent.assignAll(data);
    }
  }

  Future<void> getBrandComapny() async {
    if (auth.getTypeEnum() == Auth.comapny) {
      var data = await homeMainRepo.getCompanyBrand(contentId.value);
      brand.assignAll(data);
    }
  }
//   void  _startFilePicker() async {
//  var picked = await FilePicker.platform.pickFiles();
//     }
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     var file = File(image.path);
  //     imagefile.value = file;
  //   } catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  Future<void> addPost() async {
    if (auth.getTypeEnum() == Auth.infulonser) {
      newPost.value.infulonserId =
          (auth.getDataFromStorage() as Infulonser).id!;
    }
    newPost.value.dateTime = DateTime.now();
    await homeMainRepo.addPost(newPost.value);
    Get.back();
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
    if (res.isNotEmpty) {
      post.assignAll(res);
    }

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
