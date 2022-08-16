import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/deleteDialog.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../../sheard/auth_service.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/profile_controller.dart';
import 'build_post.dart';
import 'view_part.dart';

class EditInflounsorPage extends GetResponsiveView<ProfileController> {
  EditInflounsorPage({super.key});

  @override
  Widget builder() {
    return Column(
      children: [
        ViewPart(
            controller.infulencer.value.name!,
            controller.infulencer.value.description!,
            1,
            controller.infulencer.value.image),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Content',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.orange,
                    ),
                  ),
                  SizedBox(
                      width: 100,
                      child: QExpander(
                        expandChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: controller.allContents
                                .map(
                                  (element) => Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: TextButton(
                                        onPressed: () {
                                          controller
                                              .addcontentinfo(element.id!);
                                        },
                                        child: Text(
                                          element.name!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )),
                                )
                                .toList()),
                        child: Icon(
                          Icons.add,
                          color: AppColors.orange,
                        ),
                      )),
                ],
              ),
              SizedBox(width: screen.width, height: 65, child: contentPart()),
              Row(
                children: const [
                  Text(
                    'Post',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
              Obx(
                () => Column(
                  children: controller.posts
                      .map((e) => BuildPost(
                            infoname: controller.infulencer.value.name!,
                            post: e,
                            isEdit: true,
                          ))
                      .toList(),
                ),
              ),
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
                        Get.dialog(DeleteDialogWidget(delFunction: () async {
                          if (controller.auth.getTypeEnum() ==
                              Auth.infulonser) {
                            controller.Deletcontentinfo(e.id!);
                          } else if (controller.auth.getTypeEnum() ==
                              Auth.comapny) {
                            controller.Deletcontentcomp(e.id!);
                          }
                          Get.back();
                        }));
                      },
                    ),
                  ))
              .toList(),
        ));
  }
}
