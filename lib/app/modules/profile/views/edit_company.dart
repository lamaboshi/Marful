import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/profile_controller.dart';
import 'build_post.dart';
import 'view_part.dart';

class EditCompanyPage extends GetResponsiveView<ProfileController> {
  EditCompanyPage({super.key});

  @override
  Widget builder() {
    return Column(
      children: [
        ViewPart(
            controller.company.value.name!,
            controller.company.value.description!,
            2,
            controller.company.value.image),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Content'.tr,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.orange,
                    ),
                  ),
                  SizedBox(
                      width: 100,
                      child: QExpander(
                        child: Icon(
                          Icons.add,
                          color: AppColors.orange,
                        ),
                        expandChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: controller.allContents
                                .map(
                                  (element) => Padding(
                                      padding: EdgeInsets.all(6),
                                      child: TextButton(
                                        onPressed: () {
                                          controller
                                              .addcontentcomp(element.id!);
                                        },
                                        child: Text(
                                          element.name!,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )),
                                )
                                .toList()),
                      )),
                ],
              ),
              SizedBox(width: screen.width, height: 65, child: contentPart()),
              Row(
                children: [
                  Text(
                    'Post'.tr,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
              Obx(() => Column(
                    children: controller.posts
                        .map((e) => BuildPost(
                              infoname: controller.company.value.name!,
                              post: e,
                              isEdit: true,
                            ))
                        .toList(),
                  )),
            ],
          ),
        ),
      ],
    );
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                            'assets/images/angryimg.png',
                          )),
                        ),
                      ),
                      elevation: 2,
                      deleteIcon: Icon(Icons.close, size: 20),
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
