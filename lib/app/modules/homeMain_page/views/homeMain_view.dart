import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/values/my_flutter_app_icons.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/homeMain_controller.dart';
import '../data/model/getPost.dart';

class HomeMainView extends StatelessWidget {
  HomeMainView({Key? key}) : super(key: key);
  final controller = Get.find<HomeMainController>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
           SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 30,
                  (BuildContext context, int index) {
                return buildpost(controller.post[index]);
              }),
            ),
         
        ],
      ),
    );
  }

  Widget buildCircul(String name) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: CircleAvatar(
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
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(name),
          ),
        ],
      );
  Widget buildpost(GetPost post) => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
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
                    const Text(
                      'Haya Eid',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/ghaith.jpg',
                  height: 220,
                  width: 380,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  post.post!.description!,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          AppIcons.basket,
                          color: Colors.black,
                        ),
                      ),
                      Obx(() {
                        return IconButton(
                          onPressed: () {
                            post.interaction = !post.interaction!;
                          },
                          icon: Icon(
                            AppIcons.thumbs_down,
                            color: post.interaction == true
                                ? Colors.black
                                : AppColors.blue,
                          ),
                        );
                      }),
                      Obx(() {
                        return IconButton(
                            onPressed: () {
                              post.interaction = !post.interaction!;
                            },
                            icon: Icon(
                              AppIcons.favorite,
                              color: post.interaction == true
                                  ? Colors.red
                                  : Colors.black,
                            ));
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
