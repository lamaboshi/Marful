import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/deleteDialog.dart';
import 'package:marful/sheard/util.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/product_page_controller.dart';

class ProductPageView extends GetView<ProductPageController> {
  const ProductPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Product'.tr),
          backgroundColor: AppColors.orange,
        ),
        floatingActionButton: FloatingActionButton.extended(
            heroTag: 'uniqueTag',
            backgroundColor: AppColors.orange,
            onPressed: () {
              Get.bottomSheet(
                  exitBottomSheetDuration: const Duration(milliseconds: 400),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() => controller.stringPickImage.value.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(33),
                                  child: Utility.imageFromBase64String(
                                      controller.stringPickImage.value, 75, 75),
                                )
                              : const CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage('assets/images/person.png'),
                                )),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                              onTap: () async {
                                await controller.pickImage();
                              },
                              child:  Text('Addanimage'.tr)),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: ((p0) {
                              controller.product.value.name = p0;
                            }),
                            type: TextInputType.name,
                            obscureText: false,
                            prefIcon: Icons.input,
                            label: 'Name'.tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: ((p0) {
                              controller.product.value.description = p0;
                            }),
                            type: TextInputType.name,
                            obscureText: false,
                            prefIcon: Icons.input,
                            label: 'Description'.tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: ((p0) {
                              controller.product.value.price = int.parse(p0);
                            }),
                            type: TextInputType.number,
                            obscureText: false,
                            prefIcon: Icons.input,
                            label: 'Price'.tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: ((p0) {
                              controller.product.value.code = p0;
                            }),
                            type: TextInputType.name,
                            obscureText: false,
                            prefIcon: Icons.input,
                            label: 'Code'.tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.addproduct(controller.product.value);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.orange),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child:  Center(child: Text('Add'.tr)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ));
            },
            label: Row(
              children:  [Icon(Icons.add), Text('Add'.tr)],
            )),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: controller.allproducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shadowColor: Colors.black45,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              controller.allproducts[index].image == null
                                  ? Image.asset(
                                      'assets/images/1.jpg',
                                      height: 140,
                                      fit: BoxFit.fill,
                                    )
                                  : Utility.imageFromBase64String(
                                      Utility.base64String(
                                          controller.allproducts[index].image!),
                                      300,
                                      140),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //product
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        controller.allproducts[index].name!,
                                        style: const TextStyle(
                                            height: 1,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      //description
                                      Text(
                                        controller
                                            .allproducts[index].description!,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const Spacer(),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            Icons.price_change,
                                            color: AppColors.blue,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          //price
                                          Text(
                                            controller.allproducts[index].price!
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: AppColors.blue),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 1, 0, 5),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: (() => Get.dialog(
                                        DeleteDialogWidget(delFunction: () {
                                      controller.Delproduct(
                                          controller.allproducts[index].id!);
                                      Get.back();
                                    }))),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ));
  }
}
