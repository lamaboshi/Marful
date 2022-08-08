import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marful/app/modules/websit_company/data/model/companycontent.dart';
import 'package:marful/sheard/util.dart';

import '../../../../sheard/auth_service.dart';
import '../../../data/model/brand.dart';
import '../../../data/model/company.dart';
import '../data/brand.repostitry.dart';

class BrandPageController extends GetxController {
  final allBrands = <Brand>[].obs;
  final contents = <CompanyContent>[].obs;
  final selectCompanyContent = CompanyContent().obs;
  final brand = Brand().obs;
  final stringPickImage = ''.obs;
  final idContent = 0.obs;
  final braRepo = BrandRepository();
  final auth = Get.find<AuthService>();
  @override
  void onInit() {
    super.onInit();
    getContentComapny();
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

  Future<void> getContentComapny() async {
    var id = (auth.getDataFromStorage() as Company).id!;
    idContent.value = id;
    contents.clear();
    var data = await braRepo.GetCompanyConent(id);
    contents.assignAll(data);
  }

  Future<void> getAllBrand(int id) async {
    var data = await braRepo.getAllBrand(id);
    allBrands.assignAll(data);
  }

  Future<void> DelBrands(int id) async {
    var res = await braRepo.DelBrand(id);
    if (res) {
      getAllBrand(idContent.value);
    }
  }

  Future<void> addbrand(Brand brand) async {
    brand.image = Utility.dataFromBase64String(stringPickImage.value);
    brand.companyContentId = idContent.value;
    await braRepo.AddBrand(brand);
    getAllBrand(idContent.value);
    Get.back();
  }
}
