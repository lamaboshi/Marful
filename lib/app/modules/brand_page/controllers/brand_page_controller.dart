import 'package:get/get.dart';
import '../../../data/model/brand.dart';
import '../data/brand.repostitry.dart';

class BrandPageController extends GetxController {
  final allBrands=<Brand>[].obs;
  final brand= Brand().obs;
  final braRepo=BrandRepository();
  @override
  void onInit() {
    super.onInit();
  }
       Future<void> getAllBrand() async {
    var data = await braRepo.GetBrand();
    allBrands.assignAll(data);
  }
    Future<void> DelBrands(int id) async {
   await braRepo.DelBrand(id);
  }
    Future<void> addbrand(Brand brand) async {
     await braRepo.AddBrand(brand);
  }
  }

