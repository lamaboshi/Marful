import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/profile/views/company_profile.dart';
import 'package:marful/app/modules/profile/views/inflounsor_profile.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:marful/sheard/util.dart';

import '../controllers/profile_controller.dart';

class MainProfile extends GetView<ProfileController> {
  final bool isSearch;
  final Auth? type;
  final int? id;
  MainProfile(this.isSearch, this.type, this.id);
  @override
  Widget build(BuildContext context) {
    if (type != null) {
      controller.typeAuth.value = type!;
      if (controller.typeAuth.value == Auth.infulonser) {
        controller.getInfoType(id!);
      } else if (controller.typeAuth.value == Auth.comapny) {
        controller.getcompanyType(id!);
      }
    }
    switch (controller.typeAuth.value) {
      case Auth.infulonser:
        return Obx(() => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() => type == null
                        ? viewPart(controller.infulencer.value.name!,
                            controller.infulencer.value.image)
                        : viewPart(controller.infoSearch.value.name!,
                            controller.infoSearch.value.image)),
                    type == null
                        ? InfulonserProfilePage(false)
                        : InfulonserProfilePage(true)
                  ],
                ),
              ));
      case Auth.comapny:
        return Obx(() => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() => type == null
                        ? viewPart(controller.company.value.name!,
                            controller.company.value.image)
                        : viewPart(controller.companySearch.value.name!,
                            controller.companySearch.value.image)),
                    type == null
                        ? CompanyProfilePage(false)
                        : CompanyProfilePage(true)
                  ],
                ),
              ));

      default:
        return Text('no Value');
    }
  }

  Widget viewPart(String name, Uint8List? image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image == null
                ? Image.asset(
                    'assets/images/8.jpg',
                    width: 200,
                    height: 200,
                  )
                : Utility.imageFromBase64String(
                    Utility.base64String(image), 200, 200),
          )),
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
