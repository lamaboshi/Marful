//import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/profile/views/build_post.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:marful/sheard/date_extation.dart';
import 'package:marful/sheard/util.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/my_flutter_app_icons.dart';
import '../controllers/homeMain_controller.dart';

class HomeMainView extends GetResponsiveView<HomeMainController> {
  @override
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
              height: screen.height * 1 / 6,
              child: Obx(
                () => ListView.separated(
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
                        controller.contentId.value =
                            controller.contents[index].id!;
                        await controller.getPostsWithContent();
                      },
                      child: buildCircul(controller.contents[index].name!),
                    );
                  },
                ),
              )),
          Obx(() => controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: screen.height - 100,
                  child: controller.auth.getTypeEnum() == Auth.comapny
                      ? ListView.builder(
                          itemCount: controller.postCompany.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BuildPost(
                              infoname: 'NorrStars',
                              post: controller.postCompany[index],
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: controller.post.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buildpost(index);
                          },
                        ),
                )),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await controller.getContentComapny();
          Get.bottomSheet(
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Add new post",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    controller.auth.getTypeEnum() == Auth.comapny
                        ? SizedBox(
                            height: 30,
                            child: Obx(
                              () => ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.companyContent.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      controller.contentId.value =
                                          controller.companyContent[index].id!;
                                      await controller.getBrandComapny();
                                    },
                                    child: Obx(() {
                                      return Center(
                                        child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 130),
                                            width: 75,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 6),
                                            decoration: BoxDecoration(
                                                color: controller.selectedBrand
                                                            .value ==
                                                        index
                                                    ? AppColors.orange
                                                    : AppColors.orange
                                                        .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Center(
                                              child: Text(
                                                controller.companyContent[index]
                                                    .name!,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: controller
                                                              .selectedBrand
                                                              .value ==
                                                          index
                                                      ? Colors.white
                                                      : AppColors.orange,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            )),
                                      );
                                    }),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    width: 8,
                                  );
                                },
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    const SizedBox(
                      height: 30,
                    ),
                    controller.auth.getTypeEnum() == Auth.comapny
                        ? SizedBox(
                            height: 30,
                            child: Obx(
                              () => ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.brand.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.newPost.value.brandId =
                                          controller.brand[index].id!;
                                    },
                                    child: Obx(() {
                                      return Center(
                                        child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 130),
                                            width: 75,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 6),
                                            decoration: BoxDecoration(
                                                color: controller.selectedBrand
                                                            .value ==
                                                        index
                                                    ? AppColors.orange
                                                    : AppColors.orange
                                                        .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Center(
                                              child: Text(
                                                controller.brand[index].name!,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: controller
                                                              .selectedBrand
                                                              .value ==
                                                          index
                                                      ? Colors.white
                                                      : AppColors.orange,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            )),
                                      );
                                    }),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    width: 8,
                                  );
                                },
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      maxLines: null,
                      cursorColor: AppColors.orange,
                      showCursor: true,
                      onChanged: (value) {
                        controller.newPost.value.description = value;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write your post",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.2))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() => controller.stringPickImage.value.isEmpty
                        ? Image.asset(
                            'assets/images/ghaith.jpg',
                            width: screen.width,
                            height: screen.height / 3,
                          )
                        : Utility.imageFromBase64String(
                            controller.stringPickImage.value,
                            screen.width / 1,
                            screen.height / 6)),
                    Row(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () async {
                              await controller.pickImageFun();
                            },
                            icon: Icon(Icons.image,
                                size: 30,
                                color: AppColors.orange.withOpacity(0.4))),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () async {
                            await controller.addPost();
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.orange),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: const Text('Publish'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            exitBottomSheetDuration: const Duration(milliseconds: 400),
            enterBottomSheetDuration: const Duration(milliseconds: 500),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            backgroundColor: Colors.white,
          );
        },
        backgroundColor: AppColors.orange,
        label: Row(
          children: const [Icon(Icons.add), Text('Add post')],
        ),
      ),
    );
  }

  Widget buildCircul(String name) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.blue,
            radius: 42,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/angryimg.png',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(name),
          ),
        ],
      );
  Widget buildpost(int index) => Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: screen.height / 2.2,
          child: Card(
            elevation: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: controller.post[index].image == null
                            ? Image.asset(
                                'assets/images/ghaith.jpg',
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              )
                            : Utility.imageFromBase64String(
                                Utility.base64String(
                                    controller.post[index].image!),
                                60,
                                60),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.post[index].name == null
                                ? ''
                                : controller.post[index].name!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              controller.post[index].post!.dateTime == null
                                  ? ''
                                  : getFormattedDate(
                                      controller.post[index].post!.dateTime!),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    controller.post[index].post!.description == null
                        ? ''
                        : controller.post[index].post!.description!,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.post[index].post!.image == null
                      ? Image.asset(
                          width: screen.width / 1,
                          height: screen.height / 3.9,
                          'assets/images/angryimg.png',
                          fit: BoxFit.fill,
                        )
                      : Utility.imageFromBase64String(
                          Utility.base64String(
                              controller.post[index].post!.image!),
                          screen.width / 1,
                          screen.height / 3.9),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        // html.window.open(
                        //   '${html.window.location.protocol}/#/WebsiteCompany',
                        //   'WebsiteCompany',
                        // );
                      },
                      icon: const Icon(
                        AppIcons.basket,
                        color: Colors.black,
                      ),
                    ),
                    Text(controller.post[index].numDislike.toString()),
                    IconButton(
                      onPressed: () {
                        if (controller
                            .getifHaveUserPost(controller.post[index])) {
                          if (!controller.post[index].interaction!) {
                            controller.deletenterAction(
                                controller.post[index].post!.id!);
                          } else {
                            controller.updatenterAction(
                                controller.post[index].post!.id!, false);
                          }
                        } else {
                          controller.addInterAction(
                              controller.post[index].post!.id!, false);
                        }
                      },
                      icon: Obx(
                        () => Icon(AppIcons.thumbs_down,
                            color: controller
                                    .getifHaveUserPost(controller.post[index])
                                ? controller.post[index].interaction!
                                    ? Colors.black
                                    : AppColors.blue
                                : Colors.black),
                      ),
                    ),
                    Text(controller.post[index].numberLike.toString()),
                    IconButton(
                        onPressed: () {
                          if (controller
                              .getifHaveUserPost(controller.post[index])) {
                            if (controller.post[index].interaction!) {
                              controller.deletenterAction(
                                  controller.post[index].post!.id!);
                            } else {
                              controller.updatenterAction(
                                  controller.post[index].post!.id!, true);
                            }
                          } else {
                            controller.addInterAction(
                                controller.post[index].post!.id!, true);
                          }
                        },
                        icon: Obx(
                          () => Icon(
                            AppIcons.favorite,
                            color: controller
                                    .getifHaveUserPost(controller.post[index])
                                ? controller.post[index].interaction!
                                    ? Colors.red
                                    : Colors.black
                                : Colors.black,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
