import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:marful/sheard/util.dart';

import '../../../core/component/textField.dart';
import '../controllers/profile_controller.dart';

class ViewPart extends GetResponsiveView<ProfileController> {
  ViewPart(this.name, this.descraption, this.type, this.image);
  String name;
  String descraption;
  int type;
  Uint8List? image;
  @override
  Widget builder() {
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
                          : image == null
                              ? Image.asset(
                                  'assets/images/person.png',
                                  width: 200,
                                  height: 200,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(image!), 200, 200),
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
                        hint: 'Name',
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
                    hint: 'Phone',
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
                          hint: 'Email',
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
                              hint: 'PayPal',
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
                          hint: 'Address',
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
                              hint: 'Username',
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
                          hint: 'TelePhone',
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
                          hint: 'Description',
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
                          hint: 'Age',
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
}
