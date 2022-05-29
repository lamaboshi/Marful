import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marful/app/modules/firstsplash_page/bindings/firstSplash_binding.dart';
import 'package:marful/app/modules/intro_page/bindings/intro_binding.dart';
import 'package:marful/app/modules/intro_page/view/intro_view.dart';
import 'package:marful/app/modules/password_page/views/password_page.dart';
import 'package:marful/app/modules/signIn_page/bindings/signIn_binding.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
    //  initialRoute: AppPages.INITIAL,
    //  initialBinding: FirstSplashBinding(),
     
      debugShowCheckedModeBanner: false,
     getPages: AppPages.routes,
    ),
  );
}
