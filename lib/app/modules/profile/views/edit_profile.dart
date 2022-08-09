import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../sheard/auth_service.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/profile_controller.dart';
import 'edit_company.dart';
import 'edit_inflounsor.dart';
import 'view_part.dart';

class EditProfilePage extends GetResponsiveView<ProfileController> {
  EditProfilePage({super.key});

  @override
  Widget builder() {
    controller.info.value = controller.infulencer.value;
    controller.comp.value = controller.company.value;
    controller.use.value = controller.user.value;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.orange,
          onPressed: () async {
            await controller.UpdateDataforperson();
          },
          label: Text(
            "Save ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          )),
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(child: getType()),
    );
  }

  Widget getType() {
    //////////////////////infulonseer
    switch (controller.typeAuth.value) {
      case Auth.infulonser:
        return EditInflounsorPage();
      /////////////company
      case Auth.comapny:
        return EditCompanyPage();
      ///////////////user
      case Auth.user:
        return Column(
          children: [
            ViewPart(controller.user.value.name!, '', 3, null),
          ],
        );
      default:
        return Text('no Value');
    }
  }
}
