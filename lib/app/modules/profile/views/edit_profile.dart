import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../sheard/auth_service.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/profile_controller.dart';
import 'edit_company.dart';
import 'edit_inflounsor.dart';
import 'view_part.dart';

class EditProfilePage extends GetResponsiveView<ProfileController> {
  EditProfilePage({super.key});

  @override
  Widget builder() {
    controller.info.value = controller.infulencer.value;
    controller.comp.value = controller.company.value;
    controller.use.value = controller.user.value;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.orange,
          onPressed: () async {
            await controller.UpdateDataforperson();
          },
          label: Text(
            "buildPostSave".tr,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          )),
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Text('buildPostEditProfile'.tr),
      ),
      body: SingleChildScrollView(child: getType()),
    );
  }

  Widget getType() {
    //////////////////////infulonseer
    switch (controller.typeAuth.value) {
      case Auth.infulonser:
        return EditInflounsorPage();
      /////////////company
      case Auth.comapny:
        return EditCompanyPage();
      case Auth.user:
        return Column(
          children: [
            ViewPart(controller.user.value.name!, '', 3, null),
          ],
        );
      default:
        return Text('editProfilerNoValue'.tr);
    }
  }

  Widget contentPart() {
    return Obx(() => ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: controller.contents
              .toList()
              .map<Widget>((e) => Container(
                    height: 55,
                    padding: const EdgeInsets.all(10),
                    child: Chip(
                      backgroundColor: Colors.white,
                      label: Text(e.name!),
                      avatar: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                            'assets/images/angryimg.png',
                          )),
                        ),
                      ),
                      elevation: 2,
                      deleteIcon: const Icon(Icons.close, size: 20),
                      onDeleted: () {
                        if (controller.auth.getTypeEnum() == Auth.infulonser) {
                          controller.Deletcontentinfo(e.id!);
                        } else if (controller.auth.getTypeEnum() ==
                            Auth.comapny) {
                          controller.Deletcontentcomp(e.id!);
                        }
                      },
                    ),
                  ))
              .toList(),
        ));
  }
}
