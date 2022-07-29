import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import 'build_content.dart';
import 'build_post.dart';

class InfulonserProfilePage extends GetResponsiveView<ProfileController> {
  InfulonserProfilePage({super.key});

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
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
          child: IntrinsicHeight(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screen.width / 3.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          '6,200 ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Followors ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
          child: Column(
            children: controller.posts
                .map((e) => BuildPost(
                      infoname: controller.infulencer.value.name!,
                      description: e.description!,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
