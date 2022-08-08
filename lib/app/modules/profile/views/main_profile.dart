import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/profile/views/company_profile.dart';
import 'package:marful/app/modules/profile/views/inflounsor_profile.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:marful/sheard/util.dart';

import '../controllers/profile_controller.dart';

class MainProfile extends GetView<ProfileController> {
  final bool isSearch;
  MainProfile(this.isSearch);
  @override
  Widget build(BuildContext context) {
    switch (controller.typeAuth.value) {
      case Auth.infulonser:
        return SingleChildScrollView(
          child: Column(
            children: [
              viewPart(controller.infulencer.value.name!,
                  controller.infulencer.value.description!),
              InfulonserProfilePage(isSearch)
            ],
          ),
        );
      case Auth.comapny:
        return Column(
          children: [
            viewPart(controller.company.value.name!,
                controller.company.value.description!),
            CompanyProfilePage(isSearch)
          ],
        );

      default:
        return Text('no Value');
    }
  }

  Widget viewPart(String name, String descraption) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Obx(() => ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: controller.infulencer.value.image == null
                      ? Image.asset(
                          'assets/images/8.jpg',
                          width: 200,
                          height: 200,
                        )
                      : Utility.imageFromBase64String(
                          Utility.base64String(
                              controller.infulencer.value.image!),
                          200,
                          200),
                )),
          ),
          Center(
              child: Text(
            name == null ? '' : name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
