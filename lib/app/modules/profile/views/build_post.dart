import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:marful/sheard/date_extation.dart';
import 'package:marful/sheard/util.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/component/textField.dart';
import '../../../core/values/app_colors.dart';
import '../../homeMain_page/data/model/Post.dart';
import '../controllers/profile_controller.dart';

class BuildPost extends GetResponsiveView<ProfileController> {
  BuildPost({this.infoname = '', this.post, this.isEdit = false, super.key});
  final Post? post;
  final bool isEdit;
  final String infoname;
  @override
  Widget builder() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: screen.height / 2.2,
        child: Card(
          elevation: 2,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: controller.auth.getTypeEnum() ==
                                    Auth.infulonser
                                ? controller.infulencer.value.image == null
                                    ? Image.asset(
                                        "assets/images/8.jpg",
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      )
                                    : Utility.imageFromBase64String(
                                        Utility.base64String(
                                            controller.infulencer.value.image!),
                                        60,
                                        60)
                                : controller.auth.getTypeEnum() == Auth.comapny
                                    ? controller.company.value.image == null
                                        ? Image.asset(
                                            "assets/images/8.jpg",
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.cover,
                                          )
                                        : Utility.imageFromBase64String(
                                            Utility.base64String(controller
                                                .company.value.image!),
                                            60,
                                            60)
                                    : Image.asset(
                                        "assets/images/8.jpg",
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  infoname == null ? '' : infoname,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  post!.dateTime == null
                                      ? ''
                                      : getFormattedDate(post!.dateTime!),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.withOpacity(0.6)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      isEdit
                          ? SizedBox(
                              width: 70,
                              child: QExpander(
                                  child: Icon(
                                    Icons.more_vert_rounded,
                                    color: AppColors.orange,
                                  ),
                                  expandChild: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: TextButton(
                                            child: Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {
                                              controller.stringPickImage.value =
                                                  '';
                                              QPanel(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        'Edit Profile',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color:
                                                              AppColors.orange,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            screen.width - 50,
                                                        child: TextFieldWidget(
                                                          dufaltText: post!
                                                              .description!,
                                                          onChanged: (txt) {
                                                            if (txt != null) {
                                                              post!.description =
                                                                  txt;
                                                            }
                                                          },
                                                          type: TextInputType
                                                              .multiline,
                                                          hint: 'Description',
                                                          obscureText: false,
                                                          prefIcon:
                                                              Icons.description,
                                                        ),
                                                      ),
                                                      Obx(() => InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .pickImage();
                                                            },
                                                            child: SizedBox(
                                                              width:
                                                                  screen.width -
                                                                      34,
                                                              height: screen
                                                                      .height /
                                                                  3.74,
                                                              child: ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40),
                                                                  child: controller
                                                                          .stringPickImage
                                                                          .value
                                                                          .isNotEmpty
                                                                      ? Utility.imageFromBase64String(
                                                                          controller
                                                                              .stringPickImage
                                                                              .value,
                                                                          screen.width /
                                                                              1,
                                                                          screen.height /
                                                                              3.5)
                                                                      : post!.image ==
                                                                              null
                                                                          ? Image
                                                                              .asset(
                                                                              'assets/images/angryimg.png',
                                                                              width: screen.width / 1,
                                                                              height: screen.height / 3.5,
                                                                            )
                                                                          : Utility.imageFromBase64String(
                                                                              Utility.base64String(post!.image!),
                                                                              screen.width / 1,
                                                                              screen.height / 3.5)),
                                                            ),
                                                          )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(6),
                                                        child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(AppColors
                                                                          .blue),
                                                              fixedSize: MaterialStateProperty
                                                                  .all(const Size
                                                                          .fromWidth(
                                                                      150))),
                                                          onPressed: () async {
                                                            controller
                                                                .updatePost(
                                                                    post!.id!,
                                                                    post!);
                                                          },
                                                          child: const Text(
                                                            "Save ",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ).show();
                                            },
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(0),
                                            child: TextButton(
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              onPressed: () {
                                                controller
                                                    .deletePost(post!.id!);
                                              },
                                            ))
                                      ],
                                    ),
                                  )),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    post!.description!,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: post!.image == null
                      ? Image.asset(
                          "assets/images/angryimg.png",
                          width: screen.width / 1,
                          height: screen.height / 3.5,
                          fit: BoxFit.cover,
                        )
                      : Utility.imageFromBase64String(
                          Utility.base64String(post!.image!),
                          screen.width / 1,
                          screen.height / 3.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
