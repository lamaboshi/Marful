import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/home/views/home_view.dart';
import 'package:marful/app/modules/profile/views/edit_profile.dart';
import 'package:marful/app/modules/websit_company/views/websit_company_page.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/my_flutter_app_icons.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import 'main_profile.dart';

class ProfilePage extends GetResponsiveView<ProfileController> {
  @override
  Widget builder() {
    bool kind = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainProfile(),
        ]  ),
     ) );
  }

 

  Widget photo(String url, double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        width: width / 5,
        height: height / 5,
        child: Image.asset(url),
      ),
    );
  }
}
