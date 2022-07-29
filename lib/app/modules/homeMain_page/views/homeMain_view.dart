import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/my_flutter_app_icons.dart';
import '../controllers/homeMain_controller.dart';
import '../data/model/getPost.dart';

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
        Obx(
          () => controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: controller.post.map((element) {
                    return buildpost(element);
                  }).toList(),
                ),
        ),
      ]),
    ));
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
  Widget buildpost(GetPost post) => Padding(
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
                        child: Image.asset(
                          'assets/images/ghaith.jpg',
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        post.name == null ? '' : post.name!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                    post.post!.description == null
                        ? ''
                        : post.post!.description!,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    width: screen.width / 1,
                    height: screen.height / 3.9,
                    'assets/images/angryimg.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        AppIcons.basket,
                        color: Colors.black,
                      ),
                    ),
                    Text('3'),
                    IconButton(
                      onPressed: () {
                        post.interaction = !post.interaction!;
                      },
                      icon: Icon(
                        AppIcons.thumbs_down,
                        color: !post.noInteraction!
                            ? Colors.black
                            : AppColors.blue,
                      ),
                    ),
                    Text('20'),
                    IconButton(
                        onPressed: () {
                          post.interaction = !post.interaction!;
                        },
                        icon: Icon(
                          AppIcons.favorite,
                          color: !post.interaction! ? Colors.red : Colors.black,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
