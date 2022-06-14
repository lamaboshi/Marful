import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marful/app/modules/firstsplash_page/controllers/firstSplash_controller.dart';
import '../../../core/values/app_colors.dart';

class FiestSplashView extends GetView<FirstSplashController> {
  const FiestSplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Obx(() {
              return AnimatedOpacity(
                opacity: controller.opacity.value,
                duration: const Duration(seconds: 2),
                child: Column(
                  children: [
                    ///MarFul
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Mar',
                            style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 45.0)),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Flu',
                            style: TextStyle(
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 45.0)),
                                                                 ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    ///Marketing Influencer
                    const Text('Marketing Influencer',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                  ],
                ),
              );
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
