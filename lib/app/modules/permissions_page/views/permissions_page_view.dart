import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/data/model/company.dart';

import '../../../core/component/deleteDialog.dart';
import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/permissions_page_controller.dart';

class PermissionsPageView extends GetView<PermissionsPageController> {
  const PermissionsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Permissions'.tr),
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
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'AddnewemployeeType'.tr,
                            style: const TextStyle(fontSize: 17),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: (value) {
                              controller.newCompany.value.type = value;
                            },
                            type: TextInputType.name,
                            obscureText: false,
                            prefIcon: Icons.input,
                            label: 'Type'.tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            onChanged: (value) {
                              controller.newCompany.value.password = value;
                            },
                            type: TextInputType.name,
                            obscureText: false,
                            prefIcon: Icons.input,
                            label: 'Passeword'.tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.newCompany.value.companyId =
                                    (controller.authService.getDataFromStorage()
                                            as Company)
                                        .id!;
                                controller.addtype();
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.orange),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: Center(child: Text('Add'.tr)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ));
            },
            label: Row(
              children: [
                const Icon(Icons.add),
                const SizedBox(
                  width: 5,
                ),
                Text('Add'.tr)
              ],
            )),
        body: Obx(
          () => ListView.separated(
              padding: const EdgeInsets.all(15),
              itemBuilder: ((context, index) => Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                    child: Row(
                      children: [
                        Text(controller.typeCompanyList[index].type!),
                        const Spacer(),
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Get.bottomSheet(
                                  exitBottomSheetDuration:
                                      const Duration(milliseconds: 400),
                                  enterBottomSheetDuration:
                                      const Duration(milliseconds: 500),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Edit'.tr,
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFieldWidget(
                                            type: TextInputType.name,
                                            obscureText: false,
                                            prefIcon: Icons.input,
                                            label: 'Name'.tr,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFieldWidget(
                                            type: TextInputType.name,
                                            obscureText: false,
                                            prefIcon: Icons.input,
                                            label: 'Passeword'.tr,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          AppColors.orange),
                                                  foregroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white)),
                                              child: Center(
                                                  child: Text('Edit'.tr)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                            icon: const Icon(
                              Icons.edit,
                            )),
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Get.dialog(DeleteDialogWidget(
                                delFunction: () {
                                  controller.deletetype(
                                      controller.typeCompanyList[index].id!);
                                },
                              ));
                            },
                            icon: const Icon(
                              Icons.delete,
                            ))
                      ],
                    ),
                  ))),
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 5,
                  )),
              itemCount: controller.typeCompanyList.length),
        ));
  }
}
