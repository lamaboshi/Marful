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
            style: TextStyle(
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
<<<<<<< HEAD
        return Column(
          children: [
            viewPart(controller.infulencer.value.name!,
                controller.infulencer.value.description!, 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'editProfilerContent'.tr,
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
                                              if (controller.auth
                                                      .getTypeEnum() ==
                                                  Auth.infulonser) {
                                                controller.addcontentinfo(
                                                    element.id!);
                                              } else if (controller.auth
                                                      .getTypeEnum() ==
                                                  Auth.comapny) {
                                                controller.addcontentcomp(
                                                    element.id!);
                                              }
                                            },
                                            child: Text(
                                              element.name!,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                          )),
                                    )
                                    .toList()),
                          )),
                    ],
                  ),
                  SizedBox(
                      width: screen.width, height: 65, child: contentPart()),
                  Row(
                    children: [
                      Text(
                        'editProfilerPost'.tr,
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
      /////////////company
      case Auth.comapny:
        return Column(
          children: [
            viewPart(controller.company.value.name!,
                controller.company.value.description!, 2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'editProfilerContent'.tr,
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
                                              if (!controller.contents
                                                  .contains(element)) {
                                                controller.contents
                                                    .add(element);
                                              }
                                              contentPart();
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
                  SizedBox(
                      width: screen.width, height: 65, child: contentPart()),
                  Row(
                    children: [
                      Text(
                        'editProfilerPost'.tr,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: controller.posts
                        .map((e) => BuildPost(
                              infoname: controller.infulencer.value.name!,
                              post: e,
                              isEdit: true,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        );
=======
        return EditInflounsorPage();
      /////////////company
      case Auth.comapny:
        return EditCompanyPage();
>>>>>>> 43d837c95ce2aa383c5368a4426259af07ae4e26
      ///////////////user
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
<<<<<<< HEAD

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

  Widget viewPart(
    String name,
    String descraption,
    int type,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Obx(() => ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: controller.stringPickImage.value.isNotEmpty
                          ? Utility.imageFromBase64String(
                              controller.stringPickImage.value, 200, 200)
                          : controller.infulencer.value.image == null
                              ? Image.asset(
                                  'assets/images/8.jpg',
                                  width: 200,
                                  height: 200,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(
                                      controller.infulencer.value.image!),
                                  200,
                                  200),
                    )),
                Positioned(
                    right: -10,
                    bottom: -10,
                    child: IconButton(
                        onPressed: () async {
                          await controller.pickImage();
                        },
                        icon: Icon(Icons.camera_enhance)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('*', style: TextStyle(color: Colors.red)),
                    SizedBox(
                      width: screen.width - 50,
                      child: TextFieldWidget(
                        dufaltText: type == 1
                            ? controller.infulencer.value.name
                            : type == 2
                                ? controller.company.value.name
                                : controller.user.value.name,
                        onChanged: (txt) {
                          if (txt != null) {
                            switch (type) {
                              case 1:
                                controller.info.value.name = txt;
                                break;
                              case 2:
                                controller.comp.value.name = txt;
                                break;
                              default:
                                controller.use.value.name = txt;
                            }
                          }
                        },
                        type: TextInputType.multiline,
                        hint: 'SignUpInfName'.tr,
                        obscureText: false,
                        prefIcon: Icons.person,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: screen.width - 50,
                  child: TextFieldWidget(
                    dufaltText: type == 1
                        ? controller.infulencer.value.phone
                        : type == 2
                            ? controller.company.value.phone
                            : controller.user.value.phone,
                    onChanged: (txt) {
                      if (txt != null) {
                        switch (type) {
                          case 1:
                            controller.info.value.phone = txt;
                            break;
                          case 2:
                            controller.comp.value.phone = txt;
                            break;
                          default:
                            controller.use.value.phone = txt;
                        }
                      }
                    },
                    type: TextInputType.multiline,
                    hint: 'SignUpCmpMob'.tr,
                    obscureText: false,
                    prefIcon: Icons.phone,
                  ),
                ),
                Row(
                  children: [
                    const Text('*', style: TextStyle(color: Colors.red)),
                    SizedBox(
                      width: screen.width - 50,
                      child: TextFieldWidget(
                          dufaltText: type == 1
                              ? controller.infulencer.value.email
                              : type == 2
                                  ? controller.company.value.email
                                  : controller.user.value.email,
                          type: TextInputType.multiline,
                          hint: 'SignUpCmpEmail'.tr,
                          obscureText: false,
                          prefIcon: Icons.email,
                          onChanged: (txt) {
                            if (txt != null) {
                              switch (type) {
                                case 1:
                                  controller.info.value.email = txt;
                                  break;
                                case 2:
                                  controller.comp.value.email = txt;
                                  break;
                                default:
                                  controller.use.value.email = txt;
                              }
                            }
                          }),
                    ),
                  ],
                ),
                controller.typeAuth.value == Auth.comapny
                    ? SizedBox.shrink()
                    : Row(
                        children: [
                          const Text('*', style: TextStyle(color: Colors.red)),
                          SizedBox(
                            width: screen.width - 50,
                            child: TextFieldWidget(
                              dufaltText: type == 1
                                  ? controller.infulencer.value.paypal
                                  : controller.user.value.paypal,
                              onChanged: (txt) {
                                if (txt != null) {
                                  switch (type) {
                                    case 1:
                                      controller.info.value.paypal = txt;
                                      break;
                                    case 2:
                                      //controller.comp.value.==txt;
                                      break;
                                    default:
                                      controller.use.value.paypal = txt;
                                  }
                                }
                              },
                              type: TextInputType.multiline,
                              hint: 'SignUpInfPaybal'.tr,
                              obscureText: false,
                              prefIcon: Icons.paypal,
                            ),
                          ),
                        ],
                      ),
                controller.typeAuth.value == Auth.user
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: screen.width - 50,
                        child: TextFieldWidget(
                          dufaltText: type == 1
                              ? controller.infulencer.value.address
                              : type == 2
                                  ? controller.company.value.address
                                  : '',
                          onChanged: (txt) {
                            if (txt != null) {
                              switch (type) {
                                case 1:
                                  controller.info.value.address = txt;
                                  break;
                                case 2:
                                  controller.comp.value.address = txt;
                                  break;
                                default:
                              }
                            }
                          },
                          type: TextInputType.multiline,
                          hint: 'SignCmpUplocation'.tr,
                          obscureText: false,
                          prefIcon: Icons.location_on,
                        ),
                      ),
                controller.typeAuth.value == Auth.comapny
                    ? SizedBox.shrink()
                    : Row(
                        children: [
                          const Text('*', style: TextStyle(color: Colors.red)),
                          SizedBox(
                            width: screen.width - 50,
                            child: TextFieldWidget(
                              dufaltText: type == 1
                                  ? controller.infulencer.value.userName
                                  : controller.user.value.userName,
                              onChanged: (txt) {
                                if (txt != null) {
                                  switch (type) {
                                    case 1:
                                      controller.info.value.userName = txt;
                                      break;
                                    case 2:
                                      //   controller.comp.value.userName==txt;
                                      break;
                                    default:
                                      controller.use.value.userName = txt;
                                  }
                                }
                              },
                              type: TextInputType.multiline,
                              hint: 'SignUpInfUserName'.tr,
                              obscureText: false,
                              prefIcon: Icons.person,
                            ),
                          ),
                        ],
                      ),
                controller.typeAuth.value != Auth.comapny
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: screen.width - 50,
                        child: TextFieldWidget(
                          dufaltText: type == 2
                              ? controller.company.value.telePhone
                              : '',
                          onChanged: (txt) {
                            if (txt != null) {
                              switch (type) {
                                case 1:
                                  //   controller.info.value.==txt;
                                  break;
                                case 2:
                                  controller.comp.value.telePhone = txt;
                                  break;
                                default:
                                // controller.use.value.t=txt;
                              }
                            }
                          },
                          type: TextInputType.multiline,
                          hint: 'SignUpCmpTele'.tr,
                          obscureText: false,
                          prefIcon: Icons.phone,
                        ),
                      ),
                controller.typeAuth.value == Auth.user
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: screen.width - 50,
                        child: TextFieldWidget(
                          dufaltText: type == 1
                              ? controller.infulencer.value.description
                              : type == 2
                                  ? controller.company.value.description
                                  : '',
                          onChanged: (txt) {
                            if (txt != null) {
                              switch (type) {
                                case 1:
                                  controller.info.value.description = txt;
                                  break;
                                case 2:
                                  controller.comp.value.description = txt;
                                  break;
                                default:
                                //  controller.use.value.descraption=txt;
                              }
                            }
                          },
                          type: TextInputType.multiline,
                          hint: 'buildPostDes'.tr,
                          obscureText: false,
                          prefIcon: Icons.description,
                        ),
                      ),
                controller.typeAuth.value != Auth.user
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: screen.width - 50,
                        child: TextFieldWidget(
                          dufaltText: controller.user.value.age.toString(),
                          onChanged: (txt) {
                            if (txt != null) {
                              switch (type) {
                                case 1:
                                  //    controller.info.value.==txt;
                                  break;
                                case 2:
                                  //  controller.comp.value.==txt;
                                  break;
                                default:
                                  controller.use.value.age = int.parse(txt);
                              }
                            }
                          },
                          type: TextInputType.multiline,
                          hint: 'SignUpUserAge'.tr,
                          obscureText: false,
                          prefIcon: Icons.description,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
=======
>>>>>>> 43d837c95ce2aa383c5368a4426259af07ae4e26
}
