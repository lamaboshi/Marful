import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/profile/views/company_profile.dart';
import 'package:marful/app/modules/profile/views/inflounsor_profile.dart';
import 'package:marful/app/modules/profile/views/user_profile.dart';
import 'package:marful/sheard/auth_service.dart';

import '../controllers/profile_controller.dart';

class MainProfile extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    switch (controller.typeAuth.value) {
      case Auth.infulonser:
        return SingleChildScrollView(
          child: Column(
            children: [
              viewPart(controller.infulencer.value.name!,
                  controller.infulencer.value.description!),
              InfulonserProfilePage()
            ],
          ),
        );
      case Auth.comapny:
        return Column(
          children: [
            viewPart(controller.company.value.name!,
                controller.company.value.description!),
            CompanyProfilePage()
          ],
        );
      case Auth.user:
        return Column(
          children: [
            viewPart(controller.user.value.name!, ''),
            UserProfilePage()
          ],
        );
      default:
        return Text('no Value');
    }
  }

  Widget viewPart(String name, String descraption) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: new AssetImage("assets/images/8.jpg"),
                    fit: BoxFit.cover),
              )),
        ),
        Center(
            child: Text(
          name == null ? '' : name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}
