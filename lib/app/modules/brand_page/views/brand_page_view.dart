import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/deleteDialog.dart';
import 'package:marful/app/routes/app_pages.dart';
import 'package:marful/sheard/util.dart';
import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/brand_page_controller.dart';

class BrandPageView extends GetResponsiveView<BrandPageController> {
  @override
  Widget builder() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: const Text('Brand'),
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
                              child: const Text('Add an image..')),

                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: ((p0) {
                              controller.brand.value.name = p0;
                            }),
                            type: TextInputType.name,
                            obscureText: false,
                            prefIcon: Icons.input,
                            label: 'Name',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: ((p0) {
                              controller.brand.value.description = p0;
                            }),
                            type: TextInputType.name,
                            obscureText: false,
                            prefIcon: Icons.input,
                            label: 'Description',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                         Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.addbrand(controller.brand.value);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.orange),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: const Center(child: Text('Add')),
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
              children: const [Icon(Icons.add), Text('Add')],
            )),
        body: Column(
          children: [
            SizedBox(
                height: screen.height / 12,
                child: Obx(
                  () => ListView.separated(
              physics: const BouncingScrollPhysics(),
                    itemCount: controller.contents.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 12,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          controller.selectCompanyContent.value =
                              controller.contents[index];
                          await controller
                              .getAllBrand(controller.contents[index].id!);
                        },
                        child: Obx(
                          () => Container(
                            height: 55,
                            padding: const EdgeInsets.all(10),
                            child: Chip(
                              backgroundColor:
                                  controller.selectCompanyContent.value ==
                                          controller.contents[index]
                                      ? AppColors.blue
                                      : Colors.white,
                              label: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                    controller.contents[index].content!.name!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: controller
                                                  .selectCompanyContent.value ==
                                              controller.contents[index]
                                          ? Colors.white
                                          : Colors.black87,
                                    )),
                              ),
                              avatar: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                      'assets/images/angryimg.png',
                                    )),
                                  ),
                                ),
                              ),
                              elevation: 2,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            SizedBox(
              height: screen.height / 1.2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Obx(() => ListView.separated(
                      itemCount: controller.allBrands.length,
                      itemBuilder: ((context, index) => ListTile(
                            title: Text(controller.allBrands[index].name!),
                            subtitle:
                                Text(controller.allBrands[index].description!),
                            leading: controller.allBrands[index].image == null
                                ? Image.asset(
                                    'assets/images/3.jpg',
                                  )
                                : Utility.imageFromBase64String(
                                    Utility.base64String(
                                        controller.allBrands[index].image!),
                                    75,
                                    75),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                            ),
                            onTap: (() {
                              Get.rootDelegate.toNamed(Routes.PRODUCT_PAGE,
                                  arguments: controller.allBrands[index].id!);
                            }),
                            // onTap: () =>
                            // Get.rootDelegate.toNamed(Routes.PRODUCT_PAGE),
                            trailing: IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  Get.dialog(
                                      DeleteDialogWidget(delFunction: () {
                                    controller.DelBrands(
                                        controller.allBrands[index].id!);
                                  }));
                                  Get.back();
                                },
                                icon: const Icon(Icons.delete)),
                          )),
                      separatorBuilder: ((context, index) => const Divider(
                            endIndent: 8,
                            indent: 8,
                            thickness: 1,
                          )),
                    )),
              ),
            ),
          ],
        ));
  }
}
