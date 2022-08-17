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
        appBar: AppBar(
          title: const Text('Help'),
          backgroundColor: AppColors.orange,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: controller.help
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: InkWell(
                                  onTap: () {
                                    Get.rootDelegate.offAndToNamed(e);
                                  },
                                  child: Chip(
                                    backgroundColor: AppColors.orange,
                                    label: Text(controller
                                        .screen[controller.help.indexOf(e)].tr),
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      flex: 6,
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                          height: 2,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
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
  }
}
