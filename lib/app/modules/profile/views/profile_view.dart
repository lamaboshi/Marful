import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/core/values/app_colors.dart';

import '../../../../sheard/auth_service.dart';
import '../controllers/profile_controller.dart';
import 'main_profile.dart';

class ProfilePage extends GetResponsiveView<ProfileController> {
  final bool isSearch;
  final Auth? type;
  final int? id;
  ProfilePage(this.isSearch, this.type, this.id);
  @override
  Widget builder() {
    return Scaffold(
        appBar: isSearch
            ? AppBar(
                backgroundColor: AppColors.orange,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    }),
              )
            : null,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MainProfile(isSearch, type, id),
          ]),
        ));
  }
}
