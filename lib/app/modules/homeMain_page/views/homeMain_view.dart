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
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
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
                    SizedBox(
                      height: 30,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.brand.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.selectedBrand.value = index;
                            },
                            child: Obx(() {
                              return Center(
                                child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 130),
                                    width: 75,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 6),
                                    decoration: BoxDecoration(
                                        color: controller.selectedBrand.value ==
                                                index
                                            ? AppColors.orange
                                            : AppColors.orange.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Center(
                                      child: Text(
                                        controller.brand[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              controller.selectedBrand.value ==
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
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      maxLines: null,
                      cursorColor: AppColors.orange,
                      showCursor: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write your post",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.2))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(Icons.image,
                                size: 30,
                                color: AppColors.orange.withOpacity(0.4))),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
                height: height * 1 / 6,
                child: Obx(
                  () => controller.loading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
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
                              onTap: () {
                                controller.contentId.value =
                                    controller.contents[index].id!;
                              },
                              child:
                                  buildCircul(controller.contents[index].name!),
                            );
                          },
                        ),
                )),
          ),
          // Obx(() {
          //   return SliverList(
          //     delegate: SliverChildBuilderDelegate(childCount: 30,
          //         (BuildContext context, int index) {
          //       return buildpost(controller.post.value[index]);
          //     }),
          //   );
          // }),
        ],
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
