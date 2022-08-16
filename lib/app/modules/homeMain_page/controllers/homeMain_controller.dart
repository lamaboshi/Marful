import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marful/app/data/model/brand.dart';
import 'package:marful/app/data/model/company.dart';
import 'package:marful/app/data/model/infulonser.dart';
import 'package:marful/app/data/model/user_model.dart';
import 'package:marful/app/modules/chat_page/data/model/job.dart';
import 'package:marful/app/modules/homeMain_page/data/model/post_infulonser.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';
import 'package:marful/sheard/util.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/content.dart';
import '../../../data/repo/content_repo.dart';
import '../data/homeMain_repo.dart';
import '../data/model/Post.dart';
import '../data/model/getPost.dart';
import '../data/model/user_post.dart';

class HomeMainController extends GetxController {
  final contentRepo = ContenteRpository();
  final contents = <Content>[].obs;
  final jobs = <Job>[].obs;
  final auth = Get.find<AuthService>();
  final homeMainRepo = HomeMainRepositry();
  final post = <GetPost>[].obs;
  final mainUserpost = <PostUser>[].obs;
  final mainInfupost = <PostInfulonser>[].obs;
  final companyContent = <CompanyContent>[].obs;
  final newPost = Post().obs;
  final loading = false.obs;
  final contentId = 0.obs;
  final stringPickImage = ''.obs;
  final brand = <Brand>[].obs;
  final selectedBrand = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getContent();
    getAllPosts();
    getuserPost();
  }

  Future<void> getAllJob() async {
    if (auth.getTypeEnum() == Auth.infulonser) {
      var id = (auth.getDataFromStorage() as Infulonser).id!;
      var data = await homeMainRepo.getInfoJob(id);
      jobs.assignAll(data);
    }
  }

  Future<void> getContentComapny() async {
    if (auth.getTypeEnum() == Auth.comapny) {
      var id = (auth.getDataFromStorage() as Company).id!;
      var data = await homeMainRepo.getCompanyConent(id);
      companyContent.assignAll(data);
    }
  }

  bool getifHaveUserPost(GetPost post) {
    if (auth.getTypeEnum() == Auth.user) {
      if (mainUserpost.any((element) => element.postId == post.post!.id)) {
        return true;
      } else {
        return false;
      }
    } else if (auth.getTypeEnum() == Auth.infulonser) {
      if (mainInfupost.any((element) => element.postId == post.post!.id)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  Future<void> getuserPost() async {
    if (auth.getTypeEnum() == Auth.user) {
      var id = (auth.getDataFromStorage() as UserModel).id!;
      var data = await homeMainRepo.getByUserId(id);
      mainUserpost.assignAll(data);
      for (var item in data) {
        for (var post1 in post) {
          if (item.postId == post1.post!.id) {
            post1.interaction = item.interaction! ? item.interaction : false;
          }
        }
      }
    } else if (auth.getTypeEnum() == Auth.infulonser) {
      var id = (auth.getDataFromStorage() as Infulonser).id!;
      var data = await homeMainRepo.getByInfoId(id);
      mainInfupost.assignAll(data);
      for (var item in data) {
        for (var post1 in post) {
          if (item.postId == post1.post!.id) {
            post1.interaction = item.interaction! ? item.interaction : false;
          }
        }
      }
    }
  }

  Future<void> getBrandComapny() async {
    if (auth.getTypeEnum() == Auth.comapny) {
      var data = await homeMainRepo.getCompanyBrand(contentId.value);
      brand.assignAll(data);
    }
  }

  Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> addPost() async {
    newPost.value.image = Utility.dataFromBase64String(stringPickImage.value);
    if (auth.getTypeEnum() == Auth.infulonser) {
      newPost.value.infulonserId =
          (auth.getDataFromStorage() as Infulonser).id!;
    }
    newPost.value.dateTime = DateTime.now();
    await homeMainRepo.addPost(newPost.value);
    Get.back();
  }

  Future<void> getContent() async {
    var res = await contentRepo.getContent();
    contents.assignAll(res);
  }

  Future<void> getAllPosts() async {
    post.clear();
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

  Future<void> addInterAction(int idPost, bool interAction) async {
    if (auth.getTypeEnum() == Auth.infulonser) {
      var data = PostInfulonser(
          infulonserId: (auth.getDataFromStorage() as Infulonser).id!,
          interaction: interAction,
          postId: idPost);
      var result = await homeMainRepo.addInterActionInf(data);
      getAllPosts();
      getuserPost();
    } else if (auth.getTypeEnum() == Auth.user) {
      var data = PostUser(
          userId: (auth.getDataFromStorage() as UserModel).id!,
          interaction: interAction,
          postId: idPost);
      var result = await homeMainRepo.addInterActionUser(data);
      getAllPosts();
      getuserPost();
    }
  }

  Future<void> updatenterAction(int idPost, bool inteAction) async {
    if (auth.getTypeEnum() == Auth.infulonser) {
      var id = (auth.getDataFromStorage() as Infulonser).id!;
      var data = await homeMainRepo.getByInfoId(id);
      var userpost = data.where((element) => element.postId == idPost).first;
      userpost.interaction = inteAction;
      await homeMainRepo.updateInterActionInf(userpost.id!, userpost);
      getAllPosts();
      getuserPost();
    } else if (auth.getTypeEnum() == Auth.user) {
      var id = (auth.getDataFromStorage() as UserModel).id!;
      var data = await homeMainRepo.getByUserId(id);
      var infiupost = data.where((element) => element.postId == idPost).first;
      infiupost.interaction = inteAction;
      await homeMainRepo.updateInterActionUser(infiupost.id!, infiupost);
      getAllPosts();
      getuserPost();
    }
  }

  Future<void> deletenterAction(int idPost) async {
    if (auth.getTypeEnum() == Auth.infulonser) {
      var id = (auth.getDataFromStorage() as Infulonser).id!;
      var data = await homeMainRepo.getByInfoId(id);
      var iduserpost =
          data.where((element) => element.postId == idPost).first.id!;
      await homeMainRepo.deleteInterActionInf(iduserpost);
      getAllPosts();
      getuserPost();
    } else if (auth.getTypeEnum() == Auth.user) {
      var id = (auth.getDataFromStorage() as UserModel).id!;
      var data = await homeMainRepo.getByUserId(id);
      var iduserpost =
          data.where((element) => element.postId == idPost).first.id!;
      await homeMainRepo.deleteInterActionUser(iduserpost);
      getAllPosts();
      getuserPost();
    }
  }
}
