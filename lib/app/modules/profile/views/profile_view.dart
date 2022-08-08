import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'main_profile.dart';

class ProfilePage extends GetResponsiveView<ProfileController> {
  final bool isSearch;
  ProfilePage(this.isSearch);
  @override
  Widget builder() {
    bool kind = false;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MainProfile(isSearch),
      ]),
    ));
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
