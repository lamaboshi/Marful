import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/profile_controller.dart';
import 'build_content.dart';
import 'build_post.dart';

class CompanyProfilePage extends GetResponsiveView<ProfileController> {
  final bool isSearch;
  CompanyProfilePage(this.isSearch);
  @override
  Widget builder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isSearch
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: screen.width / 6),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.blue),
                          fixedSize: MaterialStateProperty.all(
                              const Size.fromWidth(150))),
                      onPressed: () {
                        controller.addFollow(controller.typeAuth.value);
                      },
                      child: Text(
                        "CmpProfileFollow".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          fixedSize: MaterialStateProperty.all(
                              const Size.fromWidth(150))),
                      onPressed: () {},
                      child: Text(
                        "CmpProfileMessage".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 15,
        ),
        IntrinsicHeight(
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    QPanel(
                            width: screen.width / 2,
                            alignment: Alignment.centerLeft,
                            child: Column(
                                children: controller.follower
                                    .map((element) => ListTile(
                                          leading: const Icon(Icons.person,
                                              color: AppColors.orange),
                                          title: Text(element.name!),
                                          subtitle: Text(element.email!),
                                        ))
                                    .toList()))
                        .show();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(color: AppColors.orange),
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Obx(() => Text(
                              controller.followerCount.value.toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.orange),
                            )),
                        Text(
                          'Followors'.tr,
                          style: const TextStyle(
                              fontSize: 18, color: AppColors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                OutlinedButton(
                  onPressed: () async {
                    isSearch
                        ? await controller
                            .getPostCompany(controller.companySearch.value.id!)
                        : await controller
                            .getPostCompany(controller.company.value.id!);
                    QPanel(
                        width: screen.width / 1.2,
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          child: Column(
                            children: controller.posts
                                .map((e) => BuildPost(
                                      infoname: isSearch
                                          ? controller.companySearch.value.name!
                                          : controller.company.value.name!,
                                      post: e,
                                    ))
                                .toList(),
                          ),
                        )).show();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(color: AppColors.blue),
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Obx(() => Text(
                              controller.posts.length.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        Text(
                          'CmpProfilePosts'.tr,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            'CmpProfileAboutMe'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            isSearch
                ? controller.companySearch.value.description!
                : controller.company.value.description!,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            'CmpProfileContent'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Buildcontent(),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            'Posts'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                children: controller.posts
                    .map((e) => BuildPost(
                          infoname: isSearch
                              ? controller.companySearch.value.name!
                              : controller.company.value.name!,
                          post: e,
                        ))
                    .toList(),
              ),
            )),
      ],
    );
  }
}
