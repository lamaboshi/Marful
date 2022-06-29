import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/sheard/auth_service.dart';
import 'package:q_overlay/q_overlay.dart';

import 'api/storge/storge_service.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    print('hi');
    Get.put(Dio());

    QOverlay.navigationKey = Get.key;
    var storge = Get.put(StorageService());
    storge.init();
    Get.put(AuthService());
    return GetMaterialApp.router(
      title: "MarFul",
<<<<<<< HEAD

=======
>>>>>>> b4df03e8c33bf15730b8d5d7a67294c2fef607c3
      key: key,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      enableLog: true,
    );
  }
}
