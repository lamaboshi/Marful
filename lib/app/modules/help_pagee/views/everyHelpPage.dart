// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:marful/app/core/values/app_colors.dart';
import '../controllers/help_pagee_controller.dart';

class EveryHelpPage extends GetView<HelpPageeController> {
  const EveryHelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(controller.screen[controller.index.value]),
          backgroundColor: AppColors.orange,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                  opacity: .25,
                  child: Image.asset('assets/images/Ambassador.gif')),
            ),
            Positioned.fill(
              top: 60,
              left: 30,
              right: 30,
              child: Text(controller.help[controller.index.value],style:const TextStyle(fontSize: 19),),
            )
          ],
        ));
  }
}
