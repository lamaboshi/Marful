import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marful/app/modules/product_page/data/product_repositry.dart';
import 'package:marful/app/modules/websit_company/data/model/Product.dart';
import '../../../../api/socket/managment_hub.dart';
import '../../../../sheard/util.dart';

class ProductPageController extends GetxController {
  @override
  final Repo = ProductRepository();
  final stringPickImage = ''.obs;
  late ManagementHub hub;
  final allproducts = <Product>[].obs;
  final brand = 0.obs;
  final product = Product().obs;
  void onInit() {
    super.onInit();
    getAllproducts();
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

  Future<void> getAllproducts() async {
    print('get getproducts');
    int id = int.parse(Get.rootDelegate.arguments().toString());
    brand.value = id;
    var data = await Repo.getproducts(id);
    allproducts.assignAll(data);
  }

  Future<void> Delproduct(int id) async {
    var res = await Repo.delproduct(id);
    if (res) {
      getAllproducts();
    }
  }

  Future<void> addproduct(Product product) async {
    product.image = Utility.dataFromBase64String(stringPickImage.value);
    product.brandId = brand.value;
    var res = await Repo.addproduct(product);
    if (res) {
      getAllproducts();
      Get.back();
    }
  }
}
