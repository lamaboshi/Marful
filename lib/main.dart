import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:q_overlay/q_overlay.dart';

import 'api/storge/storge_service.dart';
import 'app/routes/app_pages.dart';
import 'generated/locals.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    Get.put(Dio());
    QOverlay.navigationKey = Get.key;
    var storge = Get.put(StorageService());
    storge.init();
    Get.put(AuthService());

    return GetMaterialApp.router(
      title: "MarFul",
      key: key,
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: const Locale('en', 'EN'),
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      enableLog: true,
      theme: ThemeData(fontFamily: 'Uchen'),
    );
  }
}
