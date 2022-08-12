import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/permissions_page_controller.dart';

class PermissionsPageView extends GetView<PermissionsPageController> {
  const PermissionsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PermissionsPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PermissionsPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
