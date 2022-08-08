import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import 'build_content.dart';
import 'build_post.dart';

class InfulonserProfilePage extends GetResponsiveView<ProfileController> {
  final bool isSearch;
  InfulonserProfilePage(this.isSearch);

  @override
  Widget builder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: screen.width / 6),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.blue),
                    fixedSize:
                        MaterialStateProperty.all(const Size.fromWidth(150))),
                onPressed: () {
                  Get.rootDelegate.toNamed(Routes.WebsiteCompany);
                },
                child: const Text(
                  "Follow",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize:
                        MaterialStateProperty.all(const Size.fromWidth(150))),
                onPressed: () {},
                child: const Text(
                  "Message",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
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
                                          leading: Icon(Icons.person,
                                              color: AppColors.orange),
                                          title: Text(element.name!),
                                          subtitle: Text(element.email!),
                                        ))
                                    .toList()))
                        .show();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.orange),
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Obx(() => Text(
                              controller.followerCount.value.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.orange),
                            )),
                        Text(
                          'Followors ',
                          style:
                              TextStyle(fontSize: 18, color: AppColors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                OutlinedButton(
                  onPressed: () async {
                    await controller
                        .getPostInful(controller.infulencer.value.id!);
                    QPanel(
                        width: screen.width / 1.2,
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          child: Column(
                            children: controller.posts
                                .map((e) => BuildPost(
                                      infoname:
                                          controller.infulencer.value.name!,
                                      post: e,
                                    ))
                                .toList(),
                          ),
                        )).show();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.blue),
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Obx(() => Text(
                              controller.posts.length.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        Text(
                          'Posts',
                          style: TextStyle(fontSize: 18),
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
            ' About Me',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.infulencer.value.description!,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            ' Contents',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Buildcontent(),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            ' Posts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                children: controller.posts
                    .map((e) => BuildPost(
                          infoname: controller.infulencer.value.name!,
                          post: e,
                        ))
                    .toList(),
              ),
            ))
      ],
    );
  }
}
