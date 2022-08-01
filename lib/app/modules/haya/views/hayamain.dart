import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:marful/app/modules/haya/controllers/haya_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/my_flutter_app_icons.dart';

class HayaMain extends GetView<HayaController> {
  const HayaMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.bottomSheet(
            SingleChildScrollView(
              child: Padding(
                padding:const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Add new post",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
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
              child: ListView.separated(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: buildCircul("comidy"),
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 30,
                (BuildContext context, int index) {
              return buildpost("hiiiiiiiii decription");
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
  Widget buildpost(String descr) => Padding(
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
                  descr,
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          AppIcons.thumbs_down,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            AppIcons.favorite,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
