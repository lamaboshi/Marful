import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:marful/app/modules/firstsplash_page/bindings/firstSplash_binding.dart';
import 'package:marful/app/modules/intro_page/bindings/intro_binding.dart';
import 'package:marful/app/modules/intro_page/view/intro_view.dart';
import 'package:marful/app/modules/password_page/views/password_page.dart';
import 'package:marful/app/modules/signIn_page/bindings/signIn_binding.dart';
=======
import 'package:q_overlay/q_overlay.dart';

>>>>>>> 1dfcb95b7ec60fcb387c48602f4bf33ef6ebe30e
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Dio());
    QOverlay.navigationKey = Get.key;
    return GetMaterialApp(
      title: "Application",
<<<<<<< HEAD
    //  initialRoute: AppPages.INITIAL,
    //  initialBinding: FirstSplashBinding(),
     
      debugShowCheckedModeBanner: false,
     getPages: AppPages.routes,
    ),
  );
=======
      initialRoute: AppPages.iNITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
>>>>>>> 1dfcb95b7ec60fcb387c48602f4bf33ef6ebe30e
}
