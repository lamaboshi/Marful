import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/help_pagee/controllers/help_pagee_controller.dart';
import '../../../core/values/app_colors.dart';
import 'everyHelpPage.dart';

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
  }
}
