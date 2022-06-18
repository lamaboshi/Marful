import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    Get.put(Dio());
    QOverlay.navigationKey = Get.key;
    return GetMaterialApp.router(
      title: "MarFul",
      key: key,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      enableLog: true,
      navigatorObservers: <NavigatorObserver>[
        GetObserver(),
      ],
    );
  }
}
