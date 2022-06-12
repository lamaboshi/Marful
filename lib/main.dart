import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/app_page/views/appPage_view.dart';
import 'package:marful/app/modules/firstsplash_page/bindings/firstSplash_binding.dart';
import 'package:marful/app/modules/intro_page/bindings/intro_binding.dart';
import 'package:marful/app/modules/intro_page/view/intro_view.dart';
import 'package:marful/app/modules/password_page/views/password_page.dart';
import 'package:marful/app/modules/signIn_page/bindings/signIn_binding.dart';
import 'package:q_overlay/q_overlay.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(Dio());
    // QOverlay.navigationKey = Get.key;
    return GetMaterialApp(
      title: "Application",
      home:AppPage(),
      // initialRoute: AppPages.iNITIAL,
      // getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
