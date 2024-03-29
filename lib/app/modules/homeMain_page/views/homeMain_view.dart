import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/routes/app_pages.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:marful/sheard/date_extation.dart';
import 'package:marful/sheard/util.dart';
import 'package:q_overlay/q_overlay.dart';

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
              height: screen.height  /5,
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
                      child: controller.contents[index].id ==
                              controller.contentId.value
                          ? Container(
                              color: Colors.grey.withOpacity(0.4),
                              child:
                                  buildCircul(controller.contents[index].name!))
                          : buildCircul(controller.contents[index].name!),
                    );
                  },
                ),
              )),
          Obx(() => controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: screen.height - 100,
                  child: ListView.builder(
                    itemCount: controller.post.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildpost(index);
                    },
                  ),
                )),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: controller.auth.getTypeEnum() == Auth.user
          ? const SizedBox.shrink()
          : (controller.auth.getTypeEnum() == Auth.comapny &&
                      controller.auth.companyType() == 'chat employee') ||
                  (controller.auth.getTypeEnum() == Auth.comapny &&
                      controller.auth.companyType() == 'Editing Officer')
              ? const SizedBox.shrink()
              : FloatingActionButton.extended(
                  onPressed: () async {
                    controller.auth.getTypeEnum() == Auth.comapny
                        ? await controller.getContentComapny()
                        : await controller.getAllJob();
                    Get.bottomSheet(
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Addnewpost".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              controller.auth.getTypeEnum() == Auth.comapny
                                  ? SizedBox(
                                      height: 30,
                                      child: Obx(
                                        () => ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              controller.companyContent.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () async {
                                                controller.contentId.value =
                                                    controller
                                                        .companyContent[index]
                                                        .id!;
                                                await controller
                                                    .getBrandComapny();
                                              },
                                              child: Obx(() {
                                                return Center(
                                                  child: AnimatedContainer(
                                                      duration: const Duration(
                                                          milliseconds: 130),
                                                      width: 75,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 6,
                                                          vertical: 6),
                                                      decoration: BoxDecoration(
                                                          color: controller
                                                                      .contentId
                                                                      .value ==
                                                                  controller
                                                                      .companyContent[
                                                                          index]
                                                                      .id!
                                                              ? AppColors.orange
                                                              : AppColors.orange
                                                                  .withOpacity(
                                                                      0.1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                      child: Center(
                                                        child: Text(
                                                          controller
                                                              .companyContent[
                                                                  index]
                                                              .content!
                                                              .name!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: controller
                                                                        .contentId
                                                                        .value ==
                                                                    controller
                                                                        .companyContent[
                                                                            index]
                                                                        .id!
                                                                ? Colors.white
                                                                : AppColors
                                                                    .orange,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      )),
                                                );
                                              }),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(
                                              width: 8,
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(
                                height: 20,
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
                                                controller
                                                        .newPost.value.brandId =
                                                    controller.brand[index].id!;
                                                controller.selectedBrand.value =
                                                    index;
                                              },
                                              child: Obx(() {
                                                return Center(
                                                  child: AnimatedContainer(
                                                      duration: const Duration(
                                                          milliseconds: 130),
                                                      width: 75,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 6,
                                                          vertical: 6),
                                                      decoration: BoxDecoration(
                                                          color: controller
                                                                      .selectedBrand
                                                                      .value ==
                                                                  index
                                                              ? AppColors.orange
                                                              : AppColors.orange
                                                                  .withOpacity(
                                                                      0.1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                      child: Center(
                                                        child: Text(
                                                          controller
                                                              .brand[index]
                                                              .name!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: controller
                                                                        .selectedBrand
                                                                        .value ==
                                                                    index
                                                                ? Colors.white
                                                                : AppColors
                                                                    .orange,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      )),
                                                );
                                              }),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(
                                              width: 8,
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              controller.auth.getTypeEnum() == Auth.infulonser
                                  ? SizedBox(
                                      height: 30,
                                      child: Obx(
                                        () => controller.jobs.isNotEmpty
                                            ? ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    controller.jobs.length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      if (controller.newPost
                                                              .value.jobId !=
                                                          controller.jobs[index]
                                                              .id!) {
                                                        controller.newPost.value
                                                                .jobId =
                                                            controller
                                                                .jobs[index]
                                                                .id!;
                                                        controller.newPost
                                                            .refresh();
                                                      } else {
                                                        controller.newPost.value
                                                            .jobId = null;
                                                        controller.newPost
                                                            .refresh();
                                                      }
                                                    },
                                                    child: Obx(() {
                                                      return Center(
                                                        child:
                                                            AnimatedContainer(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        130),
                                                                width: 75,
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        6,
                                                                    vertical:
                                                                        6),
                                                                decoration: BoxDecoration(
                                                                    color: controller.newPost.value.jobId ==
                                                                            controller
                                                                                .jobs[
                                                                                    index]
                                                                                .id!
                                                                        ? AppColors
                                                                            .orange
                                                                        : AppColors
                                                                            .orange
                                                                            .withOpacity(
                                                                                0.1),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25)),
                                                                child: Center(
                                                                  child: Text(
                                                                    controller
                                                                        .jobs[
                                                                            index]
                                                                        .code!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      color: controller.newPost.value.jobId == controller.jobs[index].id!
                                                                          ? Colors
                                                                              .white
                                                                          : AppColors
                                                                              .orange,
                                                                      fontSize:
                                                                          13,
                                                                    ),
                                                                  ),
                                                                )),
                                                      );
                                                    }),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return const SizedBox(
                                                    width: 8,
                                                  );
                                                },
                                              )
                                            : Text('YouDontHavejobYet'.tr),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(
                                height: 10,
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
                                    hintText: "Writeyourpost".tr,
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.2))),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Obx(() => controller.stringPickImage.value.isEmpty
                                  ? Image.asset(
                                      'assets/images/angryimg.png',
                                      width: screen.width * 2,
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
                                          color: AppColors.orange
                                              .withOpacity(0.4))),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await controller.addPost();
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.orange),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                    child: Text('Publish'.tr),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
                    );
                  },
                  backgroundColor: AppColors.orange,
                  label: Row(
                    children: [const Icon(Icons.add), Text('Addpost'.tr)],
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
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: controller.post[index].image == null
                              ? Image.asset(
                                  'assets/images/person.png',
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
                              style: const TextStyle(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                            controller.post[index].post!.description == null
                                ? ''
                                : controller.post[index].post!.description!),
                      ),
                      controller.post[index].post!.jobId == null
                          ? const SizedBox.shrink()
                          : const Chip(
                              label: Icon(Icons.star, color: AppColors.orange),
                            )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: controller.post[index].post!.image == null
                        ? Image.asset(
                            'assets/images/angryimg.png',
                            width: screen.width,
                            fit: BoxFit.fill,
                          )
                        : Utility.imageFromBase64String(
                            Utility.base64String(
                                controller.post[index].post!.image!),
                            screen.width,
                            null),
                  ),
                  controller.auth.getTypeEnum() == Auth.comapny
                      ? const SizedBox.shrink()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            controller.auth.getTypeEnum() == Auth.user
                                ? IconButton(
                                    onPressed: () {
                                      if (controller.post[index].post!.jobId !=
                                          null) {
                                        controller.getCompanyByJob(index);
                                      } else if (controller
                                              .post[index].idCompany !=
                                          null) {
                                        if (controller.getifHaveUserPost(
                                            controller.post[index])) {
                                          Get.rootDelegate.history.clear();
                                          Get.rootDelegate.offAndToNamed(
                                              Routes.WebsiteCompany,
                                              arguments: [
                                                controller
                                                    .post[index].idCompany!,
                                                controller.mainUserpost
                                                    .where((p0) =>
                                                        p0.postId ==
                                                        controller.post[index]
                                                            .post!.id!)
                                                    .first
                                                    .id
                                              ]);
                                        } else {
                                          QPanel(
                                              alignment: Alignment.topCenter,
                                              duration:
                                                  const Duration(seconds: 2),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Plase InterAction To Post',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: AppColors.orange),
                                                ),
                                              )).show();
                                        }
                                      } else {
                                        QPanel(
                                                height: 25,
                                                child: const Center(
                                                    child: Text(
                                                        'Donot Have Job',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.red))),
                                                alignment: Alignment.topCenter,
                                                duration:
                                                    const Duration(seconds: 2))
                                            .show();
                                      }
                                    },
                                    icon: const Icon(
                                      AppIcons.basket,
                                      color: Colors.black,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Text(controller.post[index].numDislike.toString()),
                            IconButton(
                              onPressed: () {
                                if (controller.getifHaveUserPost(
                                    controller.post[index])) {
                                  if (!controller.post[index].interaction!) {
                                    controller.deletenterAction(
                                        controller.post[index].post!.id!);
                                  } else {
                                    controller.updatenterAction(
                                        controller.post[index].post!.id!,
                                        false);
                                  }
                                } else {
                                  controller.addInterAction(
                                      controller.post[index].post!.id!, false);
                                }
                              },
                              icon: Obx(
                                () => Icon(AppIcons.thumbs_down,
                                    color: controller.getifHaveUserPost(
                                            controller.post[index])
                                        ? controller.post[index].interaction!
                                            ? Colors.black
                                            : AppColors.blue
                                        : Colors.black),
                              ),
                            ),
                            Text(controller.post[index].numberLike.toString()),
                            IconButton(
                                onPressed: () {
                                  if (controller.getifHaveUserPost(
                                      controller.post[index])) {
                                    if (controller.post[index].interaction!) {
                                      controller.deletenterAction(
                                          controller.post[index].post!.id!);
                                    } else {
                                      controller.updatenterAction(
                                          controller.post[index].post!.id!,
                                          true);
                                    }
                                  } else {
                                    controller.addInterAction(
                                        controller.post[index].post!.id!, true);
                                  }
                                },
                                icon: Obx(
                                  () => Icon(
                                    AppIcons.favorite,
                                    color: controller.getifHaveUserPost(
                                            controller.post[index])
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
        ),
      );
}
