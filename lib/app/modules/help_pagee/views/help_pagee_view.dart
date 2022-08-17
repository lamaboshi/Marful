import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/help_pagee/controllers/help_pagee_controller.dart';

import '../../../core/values/app_colors.dart';

class HelpPageeView extends GetView<HelpPageeController> {
  const HelpPageeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HelpPageeController());
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: const Text('Help'),
        backgroundColor: AppColors.orange,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(15),
    
              physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) => Card(
            clipBehavior:Clip.antiAlias,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                onTap: () {
                  controller.index.value = index;
                  Get.to(const EveryHelpPage());
                },
                title: Text(controller.screen[index]),
                subtitle: Text(controller.description[index]),
              ))),
          separatorBuilder: ((context, index) => const SizedBox(
                height: 5,
              )),
          itemCount: controller.screen.length),
    );
=======
        appBar: AppBar(
          title: const Text('Help'),
          backgroundColor: AppColors.orange,
        ),
        body: Column(
          children: controller.help
              .map((e) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.help,
                        color: AppColors.orange,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        e,
                        style: const TextStyle(fontSize: 19),
                      )
                    ],
                  ))
              .toList(),
        )
        // ListView.separated(
        //     padding: const EdgeInsets.all(15),
        //     itemBuilder: ((context, index) => Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Row(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   Icon(
        //                     Icons.help,
        //                     color: AppColors.orange,
        //                   ),
        //                   SizedBox(
        //                     width: 7,
        //                   ),
        //                   Text(
        //                     controller.help[controller.index.value],
        //                     style: TextStyle(fontSize: 19),
        //                   )
        //                 ],
        //               ),
        //             )
        //         // ListTile(
        //         //   onTap: () {
        //         //     controller.index.value = index;
        //         //     Get.to(const EveryHelpPage());
        //         //   },
        //         //   title: Text(controller.screen[index]),
        //         //   subtitle: Text(controller.description[index]),
        //         // )
        //         ),
        //     separatorBuilder: ((context, index) => const SizedBox(
        //           height: 5,
        //         )),
        //     itemCount: controller.screen.length),
        );
>>>>>>> cc0742d3233425887591ce1d8b7e7d3941c6a3d5
  }
}
