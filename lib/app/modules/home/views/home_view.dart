import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          IconButton(
              icon: Icon(Icons.done),
              onPressed: () async {
                controller.pickImage();
              }),
          Obx(() => controller.imagefile.value.path.isNotEmpty
              ? Container(
                  child: Image.file(
                    controller.imagefile.value,
                    fit: BoxFit.cover,
                  ),
                )
              : SizedBox.shrink())
        ],
      )),
    );
  }
}
