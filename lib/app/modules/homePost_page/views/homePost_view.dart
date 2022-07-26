import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/component/textField.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/homePost_controller.dart';

class HomePostView extends GetView<HomePostController> {
  const HomePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Add new post",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            // const Text(
            //   "Type",
            // ),
            SizedBox(
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.type.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.selectedType.value = index;
                    },
                    child: Obx(() {
                      return Center(
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 130),
                            width: 75,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            decoration: BoxDecoration(
                                color: controller.selectedType.value == index
                                    ? AppColors.orange
                                    : AppColors.orange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text(
                                controller.type[index],
                                style: TextStyle(
                                  color: controller.selectedType.value == index
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

            Expanded(
              child: TextField(
                maxLines: null,
                cursorColor: AppColors.orange,
                showCursor: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write your post",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.2))),
              ),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     IconButton(
            //         padding: const EdgeInsets.all(0),
            //         onPressed: () {},
            //         icon: Icon(Icons.image,
            //             size: 30, color: AppColors.orange.withOpacity(0.4))),
            //   ],
            // ),

            Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.image,
                        size: 30, color: AppColors.orange.withOpacity(0.4))),
                IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.image,
                        size: 30, color: AppColors.orange.withOpacity(0.4))),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Publish'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.orange),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
